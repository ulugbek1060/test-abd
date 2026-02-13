import 'package:equatable/equatable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';

class CreateQuestionModel extends Equatable {
  final int? test;
  final String? questionText;
  final QuestionType? questionType;
  final int? orderIndex;
  final int? categoryId;
  final List<AnswerItemModel>? answers;

  const CreateQuestionModel({
    this.test,
    this.questionText,
    this.questionType,
    this.orderIndex,
    this.categoryId,
    this.answers,
  });

  CreateQuestionModel copyWith({
    int? test,
    String? questionText,
    QuestionType? questionType,
    int? orderIndex,
    int? categoryId,
    List<AnswerItemModel>? answers,
  }) => CreateQuestionModel(
    test: test ?? this.test,
    questionText: questionText ?? this.questionText,
    questionType: questionType ?? this.questionType,
    orderIndex: orderIndex ?? this.orderIndex,
    categoryId: categoryId ?? this.categoryId,
    answers: answers ?? this.answers,
  );

  Map<String, dynamic> toJson() => {
    'test': test,
    'questionText': questionText,
    'questionType': questionType,
    'orderIndex': orderIndex,
    'categoryId': categoryId,
    'answers': answers?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [
    test,
    questionText,
    questionType,
    orderIndex,
    categoryId,
    answers,
  ];
}
