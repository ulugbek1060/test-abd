import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_question_response.freezed.dart';

part 'user_question_response.g.dart';

@freezed
class UserQuestionResponse with _$UserQuestionResponse {
  const factory UserQuestionResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'test') int? test,
    @JsonKey(name: 'testTitle') String? testTitle,
    @JsonKey(name: 'questionText') String? questionText,
    @JsonKey(name: 'questionType') String? questionType,
    @JsonKey(name: 'orderIndex') int? orderIndex,
    @JsonKey(name: 'media') String? media,
    @JsonKey(name: 'answers') @Default([]) List<Answer> answers,
    @JsonKey(name: 'testDescription') String? testDescription,
    @JsonKey(name: 'correctAnswerText') String? correctAnswerText,
    @JsonKey(name: 'answerLanguage') String? answerLanguage,
    @JsonKey(name: 'correctCount') int? correctCount,
    @JsonKey(name: 'wrongCount') int? wrongCount,
    @JsonKey(name: 'difficultyPercentage') double? difficultyPercentage,
    @JsonKey(name: 'userAttemptCount') int? userAttemptCount,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'roundImage') String? roundImage,
    @JsonKey(name: 'isBookmarked') bool? isBookmarked,
    @JsonKey(name: 'isFollowing') bool? isFollowing,
    @JsonKey(name: 'category') Category? category,
  }) = _UserQuestionResponse;

  factory UserQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$UserQuestionResponseFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'totalTests') int? totalTests,
    @JsonKey(name: 'totalQuestions') int? totalQuestions,
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
    @JsonKey(name: 'answerText') String? answerText,
    @JsonKey(name: 'isCorrect') bool? isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'profileImage') String? profileImage,
    @JsonKey(name: 'isBadged') bool? isBadged,
    @JsonKey(name: 'isPremium') bool? isPremium,
    @JsonKey(name: 'isFollowing') bool? isFollowing,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
