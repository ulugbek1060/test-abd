import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/data/remote_source/quiz/models/random_questions_response.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';

part 'create_question_state.freezed.dart';

@freezed
abstract class CreateQuestionState with _$CreateQuestionState {
  const factory CreateQuestionState({
    @Default(false) bool isLoading,
    String? error,
    @Default([]) List<MyBlockModel> blocks,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<AnswerItemModel> answers,
    MyBlockModel? selectedBlock,
    CategoryModel? selectedCategory,
    @Default(QuestionType.singleSelect) QuestionType questionType,
  }) = _CreateQuestionState;

}

