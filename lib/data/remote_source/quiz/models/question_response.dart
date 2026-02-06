import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_response.freezed.dart';
part 'question_response.g.dart';

@freezed
class QuestionResponse with _$QuestionResponse {
  const factory QuestionResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'test') int? test,
    @JsonKey(name: 'test_title') String? testTitle,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'order_index') int? orderIndex,
    @JsonKey(name: 'media') String? media,
    @JsonKey(name: 'answers') List<QuestionAnswer>? answers,
    @JsonKey(name: 'test_description') String? testDescription,
    @JsonKey(name: 'correct_answer_text') String? correctAnswerText,
    @JsonKey(name: 'answer_language') String? answerLanguage,
    @JsonKey(name: 'correct_count') int? correctCount,
    @JsonKey(name: 'wrong_count') int? wrongCount,
    @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
    @JsonKey(name: 'user_attempt_count') int? userAttemptCount,
    @JsonKey(name: 'user') QuestionUser? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'round_image') String? roundImage,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'is_following') bool? isFollowing,
    @JsonKey(name: 'category') QuestionCategory? category,
  }) = _QuestionResponse;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);
}


@freezed
class QuestionUser with _$QuestionUser {
  const factory QuestionUser({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'is_badged') bool? isBadged,
    @JsonKey(name: 'is_premium') bool? isPremium,
    @JsonKey(name: 'is_following') bool? isFollowing,
  }) = _QuestionUser;

  factory QuestionUser.fromJson(Map<String, dynamic> json) =>
      _$QuestionUserFromJson(json);
}

@freezed
class QuestionAnswer with _$QuestionAnswer {
  const factory QuestionAnswer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'letter') String? letter,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  }) = _QuestionAnswer;

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerFromJson(json);
}

@freezed
class QuestionCategory with _$QuestionCategory {
  const factory QuestionCategory({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'total_tests') int? totalTests,
    @JsonKey(name: 'total_questions') int? totalQuestions,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'emoji') String? emoji,
    @JsonKey(name: 'image') String? image,
  }) = _QuestionCategory;

  factory QuestionCategory.fromJson(Map<String, dynamic> json) =>
      _$QuestionCategoryFromJson(json);
}