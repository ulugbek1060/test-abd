// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResponseImpl _$$QuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      test: (json['test'] as num?)?.toInt(),
      testTitle: json['test_title'] as String?,
      questionText: json['question_text'] as String?,
      questionType: json['question_type'] as String?,
      orderIndex: (json['order_index'] as num?)?.toInt(),
      media: json['media'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuestionAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      testDescription: json['test_description'] as String?,
      correctAnswerText: json['correct_answer_text'] as String?,
      answerLanguage: json['answer_language'] as String?,
      correctCount: (json['correct_count'] as num?)?.toInt(),
      wrongCount: (json['wrong_count'] as num?)?.toInt(),
      difficultyPercentage: (json['difficulty_percentage'] as num?)?.toDouble(),
      userAttemptCount: (json['user_attempt_count'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : QuestionUser.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      roundImage: json['round_image'] as String?,
      isBookmarked: json['is_bookmarked'] as bool?,
      isFollowing: json['is_following'] as bool?,
      category: json['category'] == null
          ? null
          : QuestionCategory.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuestionResponseImplToJson(
        _$QuestionResponseImpl instance) =>
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

_$QuestionAnswerImpl _$$QuestionAnswerImplFromJson(Map<String, dynamic> json) =>
    _$QuestionAnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
      answerText: json['answer_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
    );

Map<String, dynamic> _$$QuestionAnswerImplToJson(
        _$QuestionAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'answer_text': instance.answerText,
      'is_correct': instance.isCorrect,
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
