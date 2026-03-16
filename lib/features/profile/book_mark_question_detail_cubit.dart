import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/book_mark_question_detail_state.dart';
import 'package:testabd/main.dart';

@injectable
class BookMarkQuestionDetailCubit extends Cubit<BookMarkQuestionDetailState> {
  final AppMessageHandler _messageHandler;
  final QuizRepository _quizRepository;
  final int? questionId;

  @factoryMethod
  BookMarkQuestionDetailCubit(
    @factoryParam this.questionId,
    this._messageHandler,
    this._quizRepository,
  ) : super(BookMarkQuestionDetailState());

  Future<void> load() async {
    if (state.isLoading || questionId == null) return;

    logger.d("questionID --> : $questionId");
    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.getQuestionById(questionId!);
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(state.copyWith(error: error.message, isLoading: false));
      },
      (value) {
        emit(state.copyWith(question: value, isLoading: false, error: null));
      },
    );
  }

  void onFollow(int? id) async {}

  void submitAnswer(Set<int> answerIds) {}

  void setMultipleAnswer(int? answerId) {}

  void toggleBookmark(int? id) {}
}
