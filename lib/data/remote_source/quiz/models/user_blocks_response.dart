import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_blocks_response.freezed.dart';
part 'user_blocks_response.g.dart';

@freezed
class UserBlocksResponse with _$UserBlocksResponse {
  const factory UserBlocksResponse({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') @Default([]) List<Block> results,
  }) = _UserBlocksResponse;

  factory UserBlocksResponse.fromJson(Map<String, dynamic> json) =>
      _$UserBlocksResponseFromJson(json);
}

@freezed
class Block with _$Block {
  const factory Block({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'category') Category? category,
    @JsonKey(name: 'visibility') String? visibility,
    @JsonKey(name: 'access_mode') String? accessMode,
    @JsonKey(name: 'participant_roles') String? participantRoles,
    @JsonKey(name: 'max_participants') int? maxParticipants,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
    @JsonKey(name: 'participant_count_to_finish') int? participantCountToFinish,
    @JsonKey(name: 'country') int? country,
    @JsonKey(name: 'region') int? region,
    @JsonKey(name: 'district') int? district,
    @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
    @JsonKey(name: 'total_questions') int? totalQuestions,
    @JsonKey(name: 'questions')
    @Default([])
    List<Question> questions,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'participant_count') int? participantCount,
    @JsonKey(name: 'average_question_difficulty')
    double? averageQuestionDifficulty,
    @JsonKey(name: 'average_completion_time_minutes')
    double? averageCompletionTimeMinutes,
    @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
    @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'is_badged') bool? isBadged,
    @JsonKey(name: 'is_premium') bool? isPremium,
    @JsonKey(name: 'is_following') bool? isFollowing,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'test') int? test,
    @JsonKey(name: 'test_title') String? testTitle,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'order_index') int? orderIndex,
    @JsonKey(name: 'media') String? media,
    @JsonKey(name: 'answers') @Default([]) List<Answer> answers,
    @JsonKey(name: 'test_description') String? testDescription,
    @JsonKey(name: 'correct_answer_text') String? correctAnswerText,
    @JsonKey(name: 'answer_language') String? answerLanguage,
    @JsonKey(name: 'correct_count') int? correctCount,
    @JsonKey(name: 'wrong_count') int? wrongCount,
    @JsonKey(name: 'difficulty_percentage') double? difficultyPercentage,
    @JsonKey(name: 'user_attempt_count') int? userAttemptCount,
    @JsonKey(name: 'user') User? user,
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
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'letter') String? letter,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);
}
