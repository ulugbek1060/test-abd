// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_block_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyQuestionResponseImpl _$$MyQuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyQuestionResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : QuestionUser.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : QuestionCategory.fromJson(json['category'] as Map<String, dynamic>),
      visibility: json['visibility'] as String?,
      accessMode: json['access_mode'] as String?,
      participantRoles: json['participant_roles'] as String?,
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      minScoreToFinish: (json['min_score_to_finish'] as num?)?.toInt(),
      participantCountToFinish:
          (json['participant_count_to_finish'] as num?)?.toInt(),
      country: (json['country'] as num?)?.toInt(),
      countryId: (json['country_id'] as num?)?.toInt(),
      region: (json['region'] as num?)?.toInt(),
      district: (json['district'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      isRegionPremium: json['is_region_premium'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      difficultyPercentage: (json['difficulty_percentage'] as num?)?.toInt(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      isBookmarked: json['is_bookmarked'] as bool?,
      participantCount: (json['participant_count'] as num?)?.toInt(),
      averageQuestionDifficulty:
          (json['average_question_difficulty'] as num?)?.toInt(),
      averageCompletionTimeMinutes:
          (json['average_completion_time_minutes'] as num?)?.toInt(),
      totalCorrectAttempts: (json['total_correct_attempts'] as num?)?.toInt(),
      totalWrongAttempts: (json['total_wrong_attempts'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MyQuestionResponseImplToJson(
        _$MyQuestionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'visibility': instance.visibility,
      'access_mode': instance.accessMode,
      'participant_roles': instance.participantRoles,
      'max_participants': instance.maxParticipants,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'min_score_to_finish': instance.minScoreToFinish,
      'participant_count_to_finish': instance.participantCountToFinish,
      'country': instance.country,
      'country_id': instance.countryId,
      'region': instance.region,
      'district': instance.district,
      'district_id': instance.districtId,
      'is_region_premium': instance.isRegionPremium,
      'created_at': instance.createdAt?.toIso8601String(),
      'difficulty_percentage': instance.difficultyPercentage,
      'total_questions': instance.totalQuestions,
      'is_bookmarked': instance.isBookmarked,
      'participant_count': instance.participantCount,
      'average_question_difficulty': instance.averageQuestionDifficulty,
      'average_completion_time_minutes': instance.averageCompletionTimeMinutes,
      'total_correct_attempts': instance.totalCorrectAttempts,
      'total_wrong_attempts': instance.totalWrongAttempts,
    };

_$QuestionUserImpl _$$QuestionUserImplFromJson(Map<String, dynamic> json) =>
    _$QuestionUserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      profileImage: json['profile_image'] as String?,
      isBadged: json['is_badged'] as bool?,
      isPremium: json['is_premium'] as bool?,
      isFollowing: json['is_following'] as bool?,
    );

Map<String, dynamic> _$$QuestionUserImplToJson(_$QuestionUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profile_image': instance.profileImage,
      'is_badged': instance.isBadged,
      'is_premium': instance.isPremium,
      'is_following': instance.isFollowing,
    };

_$QuestionCategoryImpl _$$QuestionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      totalTests: (json['total_tests'] as num?)?.toInt(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      emoji: json['emoji'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$QuestionCategoryImplToJson(
        _$QuestionCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_tests': instance.totalTests,
      'total_questions': instance.totalQuestions,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'emoji': instance.emoji,
      'image': instance.image,
    };
