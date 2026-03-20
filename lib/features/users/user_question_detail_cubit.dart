import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/users/user_question_detail_state.dart';
import 'package:testabd/main.dart';

@injectable
class UserQuestionDetailCubit extends Cubit<UserQuestionDetailState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;
  final int? questionId;

  @factoryMethod
  UserQuestionDetailCubit(
    this._quizRepository,
    this._messageHandler,
    @factoryParam this.questionId,
  ) : super(UserQuestionDetailState());

  Future<void> fetchQuestion() async {
    if (state.isLoading || questionId == null) return;

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.getQuestionById(questionId!);
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(state.copyWith(isLoading: false, question: value, error: null));
      },
    );
  }

  Future<void> toggleBookmark() async {
    if (state.bookmarksState.isLoading || questionId == null) return;

    emit(
      state.copyWith(
        bookmarksState: state.bookmarksState.copyWith(isLoading: true),
      ),
    );

    final result = await _quizRepository.bookmarkQuestion(questionId!);
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            bookmarksState: state.bookmarksState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            question: state.question?.copyWith(
              isBookmarked: !(state.question?.isBookmarked ?? false),
            ),
            bookmarksState: state.bookmarksState.copyWith(isLoading: false),
          ),
        );
      },
    );
  }

  Future<void> selectAnswer(Set<int> answers) async {
    if (state.question?.isCompleted == true) return;

    if (questionId == null) {
      _messageHandler.handleDialog(UnknownErrorMsg("Question id is null"));
      return;
    }

    final answersList =
        state.question?.answers.map((e) {
          return answers.contains(e.id) ? e.copyWith(isLoading: true) : e;
        }) ??
        [];

    emit(
      state.copyWith(
        question: state.question?.copyWith(
          answers: List.of(answersList),
          myAnswersId: answers,
        ),
      ),
    );

    final result = await _quizRepository.submitAnswer(
      questionId: questionId!,
      selectedAnswers: answers,
    );

    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        final answersList =
            state.question?.answers
                .map((e) => e.copyWith(isLoading: false))
                .toList() ??
            [];
        final newQuestions = state.question?.copyWith(
          answers: List.of(answersList),
        );
        emit(state.copyWith(question: newQuestions));
      },
      (value) {
        final answersList =
            state.question?.answers
                .map((e) => e.copyWith(isLoading: false))
                .toList() ??
            [];

        final newQuestions = state.question?.copyWith(
          answers: List.of(answersList),
          isCompleted: true,
        );
        emit(state.copyWith(question: newQuestions));
      },
    );
  }

  void selectMultipleAnswers(int? list) {
    if (state.question?.isCompleted == true) return;

    if (questionId == null) {
      _messageHandler.handleDialog(UnknownErrorMsg("Question id is null"));
      return;
    }

    final answers = List.of(state.question?.answers ?? []);

  }
}
