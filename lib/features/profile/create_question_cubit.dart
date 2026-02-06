import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
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

  void createQuestion(String title, String description) async {
    final blockId = state.selectedBlock?.id;
    final categoryId = state.selectedCategory?.id;

    if (categoryId == null) {
      _appMessageHandler.handleDialog(UnknownException("Category id is null"));
      return;
    }

    if (blockId == null) {
      _appMessageHandler.handleDialog(UnknownException("Block id is null"));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.createQuestion(
      blockId: blockId,
      questionText: description,
      questionType: state.questionType,
      categoryId: categoryId,
      answers: state.answers,
    );

    result.fold((e) {
      emit(state.copyWith(error: e.message, isLoading: false));
      _appMessageHandler.handleDialog(e);
    }, (value) {
      // emit(state.copyWith(isLoading: false, question: value));
      successMessage();
    });
  }

  void reset() => emit(CreateQuestionState());

  void successMessage() {
    _appMessageHandler.handleDialog(
      SuccessException("Question created successfully"),
    );
  }
}
