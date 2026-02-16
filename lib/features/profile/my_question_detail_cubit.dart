import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/my_question_detail_state.dart';

@injectable
class MyQuestionDetailCubit extends Cubit<MyQuestionDetailState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;
  final int questionId;

  @factoryMethod
  MyQuestionDetailCubit(
    @factoryParam this.questionId,
    this._messageHandler,
    this._quizRepository,
  ) : super(MyQuestionDetailState());

  Future<void> fetchQuestion() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.getQuestionById(questionId);

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
        _messageHandler.handleDialog(error);
      },
      (value) {
        emit(state.copyWith(isLoading: false, question: value));
      },
    );
  }
}
