import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'home_state.dart';

class FollowData {
  final int userId;
  final bool isFollowed;
  FollowData(this.userId, this.isFollowed);
}

abstract class HomeFollowListener {
  Stream<FollowData> get followStream;
  void publish(FollowData data);
  void dispose();
}

@LazySingleton(as: HomeFollowListener, dispose: disposeFollowListener)
class ConnectionFollowListener implements HomeFollowListener {
  final PublishSubject<FollowData> _followSubject =
      PublishSubject<FollowData>();
  @override
  Stream<FollowData> get followStream => _followSubject.stream;
  @override
  void publish(FollowData data) => _followSubject.add(data);
  @override
  void dispose() => _followSubject.close();
}

void disposeFollowListener(HomeFollowListener listener){
  listener.dispose();
}

@injectable
class HomeCubit extends Cubit<HomeState> {
  final QuizRepository _quizRepository;
  final AccountRepository _accountRepository;
  final AppMessageHandler _messageHandler;
  final HomeFollowListener _followListener;

  final int _pageSize = 10;

  HomeCubit(
    this._followListener,
    this._quizRepository,
    this._accountRepository,
    this._messageHandler,
  ) : super(HomeState()) {
    _fetchUserInfo();

    // listen the followers
    _followListener.followStream.listen((data) {
      final updatedQuestions = state.followedQuizStata.questions.map((e) {
        if (e.user?.id == data.userId) {
          return e.copyWith(
            user: e.user?.copyWith(isFollowing: data.isFollowed),
          );
        }
        return e;
      }).toList();
      emit(
        state.copyWith(
          followedQuizStata: state.followedQuizStata.copyWith(
            questions: updatedQuestions,
          ),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _followListener.dispose();
    return super.close();
  }

  Future<void> refresh() async => getQuestions();

  Future<void> _fetchUserInfo() => _accountRepository.fetchMyInfo();

  // ---------------------------------------------------------------------------
  // Toggle bookmark
  // ---------------------------------------------------------------------------
  Future<void> toggleBookmark(int? questionId) async {
    if (questionId == null) return;
    _setBookmarkLoading(questionId, true);
    final result = await _quizRepository.bookmarkQuestion(questionId);
    result.fold((error) {
      _messageHandler.handleDialog(error);
      _setBookmarkLoading(questionId, false);
    }, (value) => _changeBookmarkValues(questionId, false));
  }

  void _setBookmarkLoading(int questionId, bool isLoading) {
    final fQuestionsState = state.followedQuizStata;
    final list = List.of(fQuestionsState.questions);
    final index = list.indexWhere((e) => e.id == questionId);
    if (index == -1) return;
    final updatedQuestion = list[index].copyWith(isBookmarkLoading: isLoading);
    list[index] = updatedQuestion;
    emit(
      state.copyWith(
        followedQuizStata: fQuestionsState.copyWith(questions: list),
      ),
    );
  }

  void _changeBookmarkValues(int questionId, bool isLoading) {
    final fQuestionsState = state.followedQuizStata;
    final list = List.of(fQuestionsState.questions);
    final index = list.indexWhere((e) => e.id == questionId);
    if (index == -1) return;
    final question = list[index];
    final updatedQuestion = question.copyWith(
      isBookmarkLoading: isLoading,
      isBookmarked: !question.isBookmarked,
    );
    list[index] = updatedQuestion;
    emit(
      state.copyWith(
        followedQuizStata: fQuestionsState.copyWith(questions: list),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Pagination
  // ---------------------------------------------------------------------------
  Future<void> getQuestions() async {
    final current = state.followedQuizStata;
    if (current.isLoading || current.isLoadMore || current.isLastPage) return;

    emit(state.copyWith(followedQuizStata: current.copyWith(isLoading: true)));
    final result = await _quizRepository.getFollowedQuestions(
      page: 1,
      pageSize: _pageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            followedQuizStata: state.followedQuizStata.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            followedQuizStata: state.followedQuizStata.copyWith(
              isLoading: false,
              error: null,
              questions: value.data,
              nextPage: value.nextPage(),
              previousPage: value.previousPage(),
            ),
          ),
        );
      },
    );
  }

  Future<void> getQuestionsByPage() async {
    final current = state.followedQuizStata;
    if (current.isLoading || current.isLoadMore || current.isLastPage) return;

    emit(state.copyWith(followedQuizStata: current.copyWith(isLoadMore: true)));
    final result = await _quizRepository.getFollowedQuestions(
      page: state.followedQuizStata.nextPage,
      pageSize: _pageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            followedQuizStata: state.followedQuizStata.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        final followedState = state.followedQuizStata;
        final fetched = value.data;
        final newFollowedState = followedState.copyWith(
          isLoading: false,
          isLoadMore: false,
          questions: [...followedState.questions, ...fetched],
          isLastPage: fetched.length < _pageSize || value.next == null,
          nextPage: value.nextPage(),
          previousPage: value.previousPage(),
          error: null,
        );
        emit(state.copyWith(followedQuizStata: newFollowedState));
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Submit Answer (Single / Multiple)
  // ---------------------------------------------------------------------------
  Future<void> submitAnswer(int questionId, Set<int> answers) async {
    final index = _findQuestionIndex(questionId);
    if (index == -1) return;
    if (state.followedQuizStata.questions[index].isLoading) return;

    _setQuestionLoading(index, answers, true);

    await Future.delayed(Duration(seconds: 1));

    final result = await _quizRepository.submitAnswer(
      questionId: questionId,
      selectedAnswers: answers,
    );

    result.fold(
      (err) => _handleSubmitError(index, answers),
      (res) => _handleSubmitSuccess(index, answers, res),
    );
  }

  // ---------------------------------------------------------------------------
  // Local Update Methods
  // ---------------------------------------------------------------------------
  void setSingleAnswer(int? questionId, int? answerId) {
    if (questionId == null || answerId == null) return;

    _updateQuestion(questionId, (q) {
      return q.copyWith(myAnswersId: {answerId});
    });
  }

  void setMultipleAnswer(int questionId, int answerId) {
    _updateQuestion(questionId, (q) {
      final list = Set<int>.from(q.myAnswersId);

      list.contains(answerId) ? list.remove(answerId) : list.add(answerId);

      return q.copyWith(myAnswersId: list);
    });
  }

  // ---------------------------------------------------------------------------
  // Private Helpers
  // ---------------------------------------------------------------------------
  int _findQuestionIndex(int questionId) =>
      state.followedQuizStata.questions.indexWhere((e) => e.id == questionId);

  void _updateQuestion(
    int questionId,
    QuestionModel Function(QuestionModel) updateFn,
  ) {
    final index = _findQuestionIndex(questionId);
    if (index == -1) return;

    final updated = List.of(state.followedQuizStata.questions);
    updated[index] = updateFn(updated[index]);

    emit(
      state.copyWith(
        followedQuizStata: state.followedQuizStata.copyWith(questions: updated),
      ),
    );
  }

  void _setQuestionLoading(int index, Set<int> answers, bool value) {
    final q = state.followedQuizStata.questions[index];

    final updatedAnswers = q.answers.map((a) {
      return answers.contains(a.id) ? a.copyWith(isLoading: value) : a;
    }).toList();

    final updated = q.copyWith(isLoading: value, answers: updatedAnswers);

    _replaceQuestion(index, updated);
  }

  void _replaceQuestion(int index, QuestionModel updated) {
    final list = List.of(state.followedQuizStata.questions);
    list[index] = updated;
    emit(
      state.copyWith(
        followedQuizStata: state.followedQuizStata.copyWith(questions: list),
      ),
    );
  }

  // ---------------- SUBMIT RESULT HANDLING ----------------
  void _handleSubmitError(int index, Set<int> answers) {
    _setQuestionLoading(index, answers, false);
  }

  void _handleSubmitSuccess(
    int index,
    Set<int> answers,
    CheckAnswerModel response,
  ) {
    final q = state.followedQuizStata.questions[index];

    final updatedAnswers = q.answers.map((a) {
      return answers.contains(a.id) ? a.copyWith(isLoading: false) : a;
    }).toList();

    final updated = q.copyWith(
      isLoading: false,
      isCompleted: true,
      isCorrect: response.isCorrect ?? false,
      myAnswersId: answers,
      answers: updatedAnswers,
    );

    _replaceQuestion(index, updated);
  }

  /// Follow/unfollow user with optimistic UI update + proper rollback
  Future<void> followUser(int? questionId, int? userId) async {
    if (userId == null)
      return; // questionId is unused → kept for signature compatibility

    // Optimistic update: show loading spinner immediately
    _setFollowLoading(userId, isLoading: true);

    final result = await _accountRepository.followUser(userId);

    result.fold(
      (failure) {
        _messageHandler.handleDialog(failure);

        // Rollback: only remove loading state
        _setFollowLoading(userId, isLoading: false);
      },
      (_) {
        // Success: toggle follow status and stop loading
        _toggleFollowStatus(userId);
      },
    );
  }

  // ====================== PRIVATE HELPERS ======================
  /// Update loading state for all questions belonging to this user
  void _setFollowLoading(int userId, {required bool isLoading}) {
    _updateQuestionsByUser(
      userId,
      (user) => user?.copyWith(isFollowInLoading: isLoading),
    );
  }

  /// Toggle follow status after successful API call
  void _toggleFollowStatus(int userId) {
    _updateQuestionsByUser(
      userId,
      (user) => user?.copyWith(
        isFollowInLoading: false,
        isFollowing: !(user.isFollowing ?? false),
      ),
    );
  }

  /// Core reusable updater – DRY, readable, and maintainable
  void _updateQuestionsByUser(
    int userId,
    UserItemModel? Function(UserItemModel? current) updateUser,
  ) {
    final currentState = state.followedQuizStata;

    final updatedQuestions = currentState.questions.map((question) {
      if (question.user?.id == userId) {
        return question.copyWith(
          user: updateUser(
            question.user,
          ), // or simply: updateUser(question.user!)
        );
      }
      return question;
    }).toList();

    emit(
      state.copyWith(
        followedQuizStata: currentState.copyWith(questions: updatedQuestions),
      ),
    );
  }
}
