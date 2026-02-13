import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_question_data_request.freezed.dart';

part 'create_question_data_request.g.dart';

@freezed
class CreateQuestionDataRequest with _$CreateQuestionDataRequest {
  const factory CreateQuestionDataRequest({
    @JsonKey(name: 'test') int? test,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'order_index') int? orderIndex,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'answers') List<CreateAnswerRequest>? answers,
  }) = _CreateQuestionDataRequest;

  factory CreateQuestionDataRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionDataRequestFromJson(json);
}

@freezed
class CreateAnswerRequest with _$CreateAnswerRequest {
  const factory CreateAnswerRequest({
    @JsonKey(name: 'letter') String? letter,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  }) = _CreateAnswerRequest;

  factory CreateAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAnswerRequestFromJson(json);
}
