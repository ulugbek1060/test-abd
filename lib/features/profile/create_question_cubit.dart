import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/create_question_data_arg.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/create_question_state.dart';
import 'package:testabd/features/profile/profile_cubit.dart';

@injectable
class CreateQuestionCubit extends Cubit<CreateQuestionState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _appMessageHandler;
  final UpdateListener _updateListener;
  late final Random _random;

  CreateQuestionCubit(
    this._quizRepository,
    this._appMessageHandler,
    @Named.from(ProfileQuestionsUpdater) this._updateListener,
  ) : super(CreateQuestionState()) {
    _random = Random();
    selectQuestionType(0);
  }

  Future<void> fetchData() async {
    emit(state.copyWith(isLoading: true));

    final results = await Future.wait([
      _quizRepository.getCategories(),
      _quizRepository.getMyBlocks(),
    ]);

    final categoriesResult =
        results[0] as Either<AppException, List<CategoryModel>>;
    final blocksResult = results[1] as Either<AppException, List<MyBlockModel>>;

    List<CategoryModel>? categories;
    List<MyBlockModel>? blocks;

    categoriesResult.fold(
      (error) => _appMessageHandler.handleDialog(error),
      (value) => categories = value,
    );

    blocksResult.fold(
      (error) => _appMessageHandler.handleDialog(error),
      (value) => blocks = value,
    );

    emit(
      state.copyWith(
        isLoading: false,
        categories: categories ?? state.categories,
        blocks: blocks ?? state.blocks,
      ),
    );
  }

  Future<void> submit(String question) async {
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

    final model = CreateQuestionModel(
      test: blockId,
      questionText: question,
      categoryId: categoryId,
      orderIndex: _random.nextInt(100),
      questionType: state.questionType,
      answers: state.answers,
    );
    final result = await _quizRepository.createQuestion(model: model);
    result.fold(
      (e) {
        emit(state.copyWith(error: e.message, isLoading: false));
        _appMessageHandler.handleDialog(e);
      },
      (value) {
        emit(state.copyWith(isLoading: false, question: value));
        successMessage();
      },
    );
  }

  void reset() => emit(CreateQuestionState());

  void successMessage() {
    _appMessageHandler.handleSnackBar(
      SuccessException("Question created successfully"),
    );
    _updateListener.onUpdate();
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

  void selectQuestionType(int? value) {
    if (value == null) return;
    final type = QuestionType.values[value];

    List<AnswerItemModel> answers;

    switch (type) {
      case QuestionType.singleSelect:
        answers = List.of([
          AnswerItemModel(letter: "A", isCorrect: true),
          AnswerItemModel(letter: "B", isCorrect: false),
          AnswerItemModel(letter: "D", isCorrect: false),
        ]);
        break;
      case QuestionType.multipleSelect:
        answers = List.of([
          AnswerItemModel(letter: "A", isCorrect: true),
          AnswerItemModel(letter: "B", isCorrect: false),
          AnswerItemModel(letter: "D", isCorrect: false),
        ]);
        break;
      case QuestionType.trueFalse:
        answers = List.of([
          AnswerItemModel(letter: "A", isCorrect: true),
          AnswerItemModel(letter: "B", isCorrect: false),
        ]);
        break;
      case QuestionType.textQuestion:
        answers = List.of([AnswerItemModel(letter: "A", isCorrect: false)]);
        break;
    }

    emit(state.copyWith(questionType: type, answers: answers));
  }

  void addAnswer() {
    final answers = List.of(state.answers);

    switch (state.questionType) {
      case QuestionType.singleSelect:
        if (state.answers.length == 3) {
          answers.add(AnswerItemModel(letter: "C", isCorrect: false));
        }
        if (state.answers.length == 4) {
          answers.add(AnswerItemModel(letter: "E", isCorrect: false));
        }
        break;
      case QuestionType.multipleSelect:
        if (state.answers.length < 4) {
          answers.add(AnswerItemModel(letter: "C", isCorrect: false));
        }
        break;
      case QuestionType.trueFalse:
        break;
      case QuestionType.textQuestion:
        break;
    }

    emit(state.copyWith(answers: answers));
  }

  void removeAnswer(int index) {
    final answers = List.of(state.answers);
    switch (state.questionType) {
      case QuestionType.singleSelect:
        if (answers.length > 3) answers.removeAt(index);
        break;
      case QuestionType.multipleSelect:
        if (answers.length > 3) answers.removeAt(index);
        break;
      case QuestionType.trueFalse:
        break;
      case QuestionType.textQuestion:
        break;
    }
    emit(state.copyWith(answers: answers));
  }

  void onSelectItemFromMultipleAnswers(int index, bool? value) {
    final answers = List.of(state.answers);
    answers[index] = answers[index].copyWith(isCorrect: value);
    int checker = 0;
    for (var v in answers) {
      if (v.isCorrect) {
        checker++;
      }
    }
    if (checker > 0) emit(state.copyWith(answers: answers));
  }

  void onSelectItemFromSingleAnswer(int index) {
    final answers = List.of(state.answers);
    for (var i = 0; i < answers.length; i++) {
      if (index == i) {
        answers[i] = answers[i].copyWith(isCorrect: true);
      } else {
        answers[i] = answers[i].copyWith(isCorrect: false);
      }
    }
    emit(state.copyWith(answers: answers));
  }

  void onChangeAnswerByIndex(int index, String value) {
    final answers = List.of(state.answers);
    answers[index] = answers[index].copyWith(answerText: value);
    emit(state.copyWith(answers: answers));
  }
}
