import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/users/user_question_detail_state.dart';

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

  void toggleBookmark() async {
    if (state.isLoading || questionId == null) return;

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.bookmarkQuestion(questionId!);
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
}
