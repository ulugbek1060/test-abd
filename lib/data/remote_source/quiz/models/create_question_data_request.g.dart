// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateQuestionDataRequestImpl _$$CreateQuestionDataRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateQuestionDataRequestImpl(
      test: (json['test'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      questionType: json['question_type'] as String?,
      orderIndex: (json['order_index'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => CreateAnswerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateQuestionDataRequestImplToJson(
        _$CreateQuestionDataRequestImpl instance) =>
    <String, dynamic>{
      'test': instance.test,
      'question_text': instance.questionText,
      'question_type': instance.questionType,
      'order_index': instance.orderIndex,
      'category_id': instance.categoryId,
      'answers': instance.answers,
    };

_$CreateAnswerRequestImpl _$$CreateAnswerRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAnswerRequestImpl(
      letter: json['letter'] as String?,
      answerText: json['answer_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
    );

Map<String, dynamic> _$$CreateAnswerRequestImplToJson(
        _$CreateAnswerRequestImpl instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'answer_text': instance.answerText,
      'is_correct': instance.isCorrect,
    };
