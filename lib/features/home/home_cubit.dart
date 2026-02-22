import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final QuizRepository _quizRepository;
  final AccountRepository _accountRepository;
  final int _pageSize = 10;
  final AppMessageHandler _messageHandler;

  HomeCubit(this._quizRepository, this._accountRepository, this._messageHandler)
    : super(HomeState()) {
    _fetchUserInfo();
  }

  Future<void> refresh() async {
    // update follow state to new empty state
    _updateFollowedState(FollowedQuizState());

    // load quiz
    await loadQuiz();
  }

  Future<void> _fetchUserInfo() async {
    final result = await _accountRepository.fetchMyInfo();
    result.fold((error) {
      _messageHandler.handleDialog(error);
    }, (value) {});
  }

  // ---------------------------------------------------------------------------
  // Pagination
  // ---------------------------------------------------------------------------
  Future<void> loadQuiz() async {
    final followedQuizState = state.followedQuizStata;

    if (followedQuizState.questions.isEmpty) {
      _updateFollowedState(followedQuizState.copyWith(isLoading: true));
    } else {
      _updateFollowedState(followedQuizState.copyWith(isLoadMore: true));
    }

    // delay
    await Future.delayed(Duration(microseconds: 300));

    final result = await _quizRepository.getFollowedQuestions(
      page: followedQuizState.nextPage,
      pageSize: _pageSize,
    );

    result.fold(
      // set new state
      (err) {
        _updateFollowedState(
          followedQuizState.copyWith(
            isLoading: false,
            isLoadMore: false,
            error: err.message,
          ),
        );

        // handle message
        _messageHandler.handleDialog(err);
      },
      (value) {
        final followedState = state.followedQuizStata;
        final fetched = value.data;
        final newFollowedState = followedState.copyWith(
          isLoading: false,
          isLoadMore: false,
          questions: [...followedState.questions, ...fetched],
          isLastPage: fetched.length < _pageSize,
          nextPage: followedState.nextPage + 1,
          previousPage: followedState.nextPage > 1
              ? followedState.nextPage - 1
              : 1,
          error: null,
        );

        // set new state
        _updateFollowedState(newFollowedState);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Submit Answer (Single / Multiple)
  // ---------------------------------------------------------------------------
  Future<void> submitAnswer(int questionId, List<int> answers) async {
    final index = _findQuestionIndex(questionId);
    if (index == -1) return;

    _setQuestionLoading(index, answers, true);

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
      final list = List<int>.from(q.myAnswersId);

      list.contains(answerId) ? list.remove(answerId) : list.add(answerId);

      return q.copyWith(myAnswersId: list);
    });
  }

  // ---------------------------------------------------------------------------
  // Private Helpers
  // ---------------------------------------------------------------------------
  int _findQuestionIndex(int questionId) =>
      state.followedQuizStata.questions.indexWhere((e) => e.id == questionId);

  void _updateQuestion(int questionId, QuestionModel Function(QuestionModel) updateFn) {
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

  void _setQuestionLoading(int index, List<int> answers, bool value) {
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
    _updateFollowedState(state.followedQuizStata.copyWith(questions: list));
  }

  // ---------------- SUBMIT RESULT HANDLING ----------------
  void _handleSubmitError(int index, List<int> answers) {
    _setQuestionLoading(index, answers, false);
  }

  void _handleSubmitSuccess(
    int index,
    List<int> answers,
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
}

extension HomeCubitX on HomeCubit {
  void _updateFollowedState(FollowedQuizState updated) {
    emit(state.copyWith(followedQuizStata: updated));
  }
}
