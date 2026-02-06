import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/create_question_state.dart';

@injectable
class CreateQuestionCubit extends Cubit<CreateQuestionState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _appMessageHandler;

  CreateQuestionCubit(this._quizRepository, this._appMessageHandler)
    : super(CreateQuestionState()) {
    generateSingleSelectAnswers();
  }

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

  void generateSingleSelectAnswers() async {
    final answers = List.of(state.answers);
    answers.clear();
    answers.add(AnswerItemModel(answerText: "", letter: "A", isCorrect: false));
    answers.add(AnswerItemModel(answerText: "", letter: "B", isCorrect: false));
    answers.add(AnswerItemModel(answerText: "", letter: "C", isCorrect: false));
    emit(state.copyWith(answers: answers));
  }

  void generateMultipleSelectAnswers() {
    final answers = List.of(state.answers);
    answers.clear();
    answers.add(AnswerItemModel(answerText: "", letter: "A", isCorrect: false));
    emit(state.copyWith(answers: answers));
  }

  void generateTrueFalse() {
    final answers = List.of(state.answers);
    answers.clear();
    answers.add(AnswerItemModel(answerText: "", letter: "A", isCorrect: false));
    answers.add(AnswerItemModel(answerText: "", letter: "B", isCorrect: false));
    emit(state.copyWith(answers: answers));
  }

  void generateTextAnswer(){
    final answers = List.of(state.answers);
    answers.clear();
    answers.add(AnswerItemModel(answerText: "", letter: "A", isCorrect: false));
    emit(state.copyWith(answers: answers));
  }

  void submit(String title, String description) async {
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

    result.fold(
      (e) {
        emit(state.copyWith(error: e.message, isLoading: false));
        _appMessageHandler.handleDialog(e);
      },
      (value) {
        // emit(state.copyWith(isLoading: false, question: value));
        successMessage();
      },
    );
  }

  void reset() => emit(CreateQuestionState());

  void successMessage() {
    _appMessageHandler.handleDialog(
      SuccessException("Question created successfully"),
    );
  }

  void selectCategory(int? v) => emit(
    state.copyWith(
      selectedCategory: state.categories.firstWhereOrNull((e) => e.id == v),
    ),
  );

  void selectBlock(int? v) => emit(
    state.copyWith(
      selectedBlock: state.blocks.firstWhereOrNull((e) => e.id == v),
    ),
  );

  void addAnswer() {
    final answers = List.of(state.answers);
    answers.add(
      AnswerItemModel(answerText: "answer 1", letter: "a", isCorrect: false),
    );
    emit(state.copyWith(answers: answers));
  }

  void removeAnswer(int index) {
    final answers = List.of(state.answers);
    answers.removeAt(index);
    emit(state.copyWith(answers: answers));
  }

  void toggleQuestionType(QuestionType type) {
    emit(state.copyWith(questionType: type));
    if (type == QuestionType.singleSelect) {
      generateSingleSelectAnswers();
    }  else if (type == QuestionType.multipleSelect) {
     // generateSingleAnswer();
    }
  }
}
