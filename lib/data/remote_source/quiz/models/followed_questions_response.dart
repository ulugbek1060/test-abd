import 'package:freezed_annotation/freezed_annotation.dart';

part 'followed_questions_response.freezed.dart';
part 'followed_questions_response.g.dart';

@freezed
class FollowedQuestionsResponse with _$FollowedQuestionsResponse {
  const factory FollowedQuestionsResponse({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @Default([]) @JsonKey(name: 'results') List<Question> results,
  }) = _FollowedQuestionsResponse;

  factory FollowedQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowedQuestionsResponseFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'test') int? test,
    @JsonKey(name: 'test_title') String? testTitle,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'order_index') int? orderIndex,
    @JsonKey(name: 'media') String? media,
    @Default([]) @JsonKey(name: 'answers') List<Answer> answers,
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
    @JsonKey(name: 'category') Category? category,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'total_tests') int? totalTests,
    @JsonKey(name: 'total_questions') int? totalQuestions,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'emoji') String? emoji,
    @JsonKey(name: 'image') String? image,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'letter') String? letter,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
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