
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_block_response.freezed.dart';
part 'my_block_response.g.dart';

@freezed
class MyBlockResponse with _$MyBlockResponse {
  const factory MyBlockResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user') QuestionUser? user,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'category') QuestionCategory? category,
    @JsonKey(name: 'visibility') String? visibility,
    @JsonKey(name: 'access_mode') String? accessMode,
    @JsonKey(name: 'participant_roles') String? participantRoles,
    @JsonKey(name: 'max_participants') int? maxParticipants, // not defined
    @JsonKey(name: 'start_time') DateTime? startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    @JsonKey(name: 'min_score_to_finish') int? minScoreToFinish,
    @JsonKey(name: 'participant_count_to_finish') int? participantCountToFinish,
    @JsonKey(name: 'country') int? country,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'region') int? region,
    @JsonKey(name: 'district') int? district,
    @JsonKey(name: 'district_id') int? districtId,
    @JsonKey(name: 'is_region_premium') bool? isRegionPremium,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'difficulty_percentage') int? difficultyPercentage,
    @JsonKey(name: 'total_questions') int? totalQuestions,
    // @JsonKey(name: 'questions') String? questions,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'participant_count') int? participantCount,
    @JsonKey(name: 'average_question_difficulty') int? averageQuestionDifficulty,
    @JsonKey(name: 'average_completion_time_minutes') int? averageCompletionTimeMinutes,
    @JsonKey(name: 'total_correct_attempts') int? totalCorrectAttempts,
    @JsonKey(name: 'total_wrong_attempts') int? totalWrongAttempts,
  }) = _MyQuestionResponse;

  factory MyBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$MyBlockResponseFromJson(json);
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

/// questions
//flutter: ║                {
// flutter: ║                     "id": 343,
// flutter: ║                     "test": 46,
// flutter: ║                     "test_title": "Vocabulary",
// flutter: ║                     "question_text": "Tasir, asorat",
// flutter: ║                     "question_type": "single",
// flutter: ║                     "order_index": 1756918537505,
// flutter: ║                     "media": null,
// flutter: ║                     "answers": [
// flutter: ║                      {id: 928, letter: A, answer_text: Implication, is_correct: true},
// flutter: ║                      {id: 929, letter: B, answer_text: Suspicion, is_correct: false},
// flutter: ║                      {id: 930, letter: D, answer_text: Measure, is_correct: false}
// flutter: ║                     ],
// flutter: ║                     "test_description": "Vocabulary",
// flutter: ║                     "correct_answer_text": null,
// flutter: ║                     "answer_language": null,
// flutter: ║                     "correct_count": 1,
// flutter: ║                     "wrong_count": 0,
// flutter: ║                     "difficulty_percentage": 0.0,
// flutter: ║                     "user_attempt_count": 1,
// flutter: ║                     "user": {
// flutter: ║                         "id": 21,
// flutter: ║                         "username": "abdulaziz",
// flutter: ║                         "profile_image": "https://backend.testabd.uz/media/profiles/1000000835.jpg"
// flutter: ║                         "is_badged": true,
// flutter: ║                         "is_premium": false,
// flutter: ║                         "is_following": false
// flutter: ║                    }
// flutter: ║                     "created_at": "2025-09-03T21:56:32.669000+05:00",
// flutter: ║                     "round_image": "https://picsum.photos/seed/4a3780b29f/720/1280",
// flutter: ║                     "is_bookmarked": false,
// flutter: ║                     "is_following": false,
// flutter: ║                     "category": {
// flutter: ║                         "id": 32,
// flutter: ║                         "total_tests": 3,
// flutter: ║                         "total_questions": 5202,
// flutter: ║                         "title": "Inglis tili",
// flutter: ║                         "slug": "inglis-tili",
// flutter: ║                         "description": "Inglis tili haqida barcha testlar toʻplami shu joyda."
// flutter: ║                         "emoji": "",
// flutter: ║                         "image": null
// flutter: ║                    }
// flutter: ║                }