import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/create_question_state.dart';

@injectable
class CreateQuestionCubit extends Cubit<CreateQuestionState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _appMessageHandler;

  CreateQuestionCubit(this._quizRepository, this._appMessageHandler)
    : super(CreateQuestionState());



  Future<void> fetchCategories() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    final result = await _quizRepository.getCategories();
    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(state.copyWith(isLoading: false, categories: value));
      },
    );
  }

  void createQuestion() async{
    final result = await  _quizRepository.createQuestion();
  }

  void reset() {
    emit(CreateQuestionState());
  }

  void successMessage() {
    _appMessageHandler.handleDialog(
      SuccessException("Question created successfully"),
    );
  }

}
