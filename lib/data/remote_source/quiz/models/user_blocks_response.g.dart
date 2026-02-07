// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_blocks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlocksResponseImpl _$$UserBlocksResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBlocksResponseImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserBlocksResponseImplToJson(
        _$UserBlocksResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$BlockImpl _$$BlockImplFromJson(Map<String, dynamic> json) => _$BlockImpl(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      visibility: json['visibility'] as String?,
      accessMode: json['access_mode'] as String?,
      participantRoles: json['participant_roles'] as String?,
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      minScoreToFinish: (json['min_score_to_finish'] as num?)?.toInt(),
      participantCountToFinish:
          (json['participant_count_to_finish'] as num?)?.toInt(),
      country: (json['country'] as num?)?.toInt(),
      region: (json['region'] as num?)?.toInt(),
      district: (json['district'] as num?)?.toInt(),
      isRegionPremium: json['is_region_premium'] as bool?,
      createdAt: json['created_at'] as String?,
      difficultyPercentage: (json['difficulty_percentage'] as num?)?.toDouble(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isBookmarked: json['is_bookmarked'] as bool?,
      participantCount: (json['participant_count'] as num?)?.toInt(),
      averageQuestionDifficulty:
          (json['average_question_difficulty'] as num?)?.toDouble(),
      averageCompletionTimeMinutes:
          (json['average_completion_time_minutes'] as num?)?.toDouble(),
      totalCorrectAttempts: (json['total_correct_attempts'] as num?)?.toInt(),
      totalWrongAttempts: (json['total_wrong_attempts'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BlockImplToJson(_$BlockImpl instance) =>
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
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'min_score_to_finish': instance.minScoreToFinish,
      'participant_count_to_finish': instance.participantCountToFinish,
      'country': instance.country,
      'region': instance.region,
      'district': instance.district,
      'is_region_premium': instance.isRegionPremium,
      'created_at': instance.createdAt,
      'difficulty_percentage': instance.difficultyPercentage,
      'total_questions': instance.totalQuestions,
      'questions': instance.questions,
      'is_bookmarked': instance.isBookmarked,
      'participant_count': instance.participantCount,
      'average_question_difficulty': instance.averageQuestionDifficulty,
      'average_completion_time_minutes': instance.averageCompletionTimeMinutes,
      'total_correct_attempts': instance.totalCorrectAttempts,
      'total_wrong_attempts': instance.totalWrongAttempts,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      profileImage: json['profile_image'] as String?,
      isBadged: json['is_badged'] as bool?,
      isPremium: json['is_premium'] as bool?,
      isFollowing: json['is_following'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profile_image': instance.profileImage,
      'is_badged': instance.isBadged,
      'is_premium': instance.isPremium,
      'is_following': instance.isFollowing,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      totalTests: (json['total_tests'] as num?)?.toInt(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      emoji: json['emoji'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
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

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      test: (json['test'] as num?)?.toInt(),
      testTitle: json['test_title'] as String?,
      questionText: json['question_text'] as String?,
      questionType: json['question_type'] as String?,
      orderIndex: (json['order_index'] as num?)?.toInt(),
      media: json['media'] as String?,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      testDescription: json['test_description'] as String?,
      correctAnswerText: json['correct_answer_text'] as String?,
      answerLanguage: json['answer_language'] as String?,
      correctCount: (json['correct_count'] as num?)?.toInt(),
      wrongCount: (json['wrong_count'] as num?)?.toInt(),
      difficultyPercentage: (json['difficulty_percentage'] as num?)?.toDouble(),
      userAttemptCount: (json['user_attempt_count'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      roundImage: json['round_image'] as String?,
      isBookmarked: json['is_bookmarked'] as bool?,
      isFollowing: json['is_following'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'test': instance.test,
      'test_title': instance.testTitle,
      'question_text': instance.questionText,
      'question_type': instance.questionType,
      'order_index': instance.orderIndex,
      'media': instance.media,
      'answers': instance.answers,
      'test_description': instance.testDescription,
      'correct_answer_text': instance.correctAnswerText,
      'answer_language': instance.answerLanguage,
      'correct_count': instance.correctCount,
      'wrong_count': instance.wrongCount,
      'difficulty_percentage': instance.difficultyPercentage,
      'user_attempt_count': instance.userAttemptCount,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'round_image': instance.roundImage,
      'is_bookmarked': instance.isBookmarked,
      'is_following': instance.isFollowing,
      'category': instance.category,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
      answerText: json['answer_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'answer_text': instance.answerText,
      'is_correct': instance.isCorrect,
    };
