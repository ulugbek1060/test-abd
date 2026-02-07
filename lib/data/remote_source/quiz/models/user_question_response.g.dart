// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserQuestionResponseImpl _$$UserQuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserQuestionResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      test: (json['test'] as num?)?.toInt(),
      testTitle: json['testTitle'] as String?,
      questionText: json['questionText'] as String?,
      questionType: json['questionType'] as String?,
      orderIndex: (json['orderIndex'] as num?)?.toInt(),
      media: json['media'] as String?,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      testDescription: json['testDescription'] as String?,
      correctAnswerText: json['correctAnswerText'] as String?,
      answerLanguage: json['answerLanguage'] as String?,
      correctCount: (json['correctCount'] as num?)?.toInt(),
      wrongCount: (json['wrongCount'] as num?)?.toInt(),
      difficultyPercentage: (json['difficultyPercentage'] as num?)?.toDouble(),
      userAttemptCount: (json['userAttemptCount'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      roundImage: json['roundImage'] as String?,
      isBookmarked: json['isBookmarked'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserQuestionResponseImplToJson(
        _$UserQuestionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'test': instance.test,
      'testTitle': instance.testTitle,
      'questionText': instance.questionText,
      'questionType': instance.questionType,
      'orderIndex': instance.orderIndex,
      'media': instance.media,
      'answers': instance.answers,
      'testDescription': instance.testDescription,
      'correctAnswerText': instance.correctAnswerText,
      'answerLanguage': instance.answerLanguage,
      'correctCount': instance.correctCount,
      'wrongCount': instance.wrongCount,
      'difficultyPercentage': instance.difficultyPercentage,
      'userAttemptCount': instance.userAttemptCount,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'roundImage': instance.roundImage,
      'isBookmarked': instance.isBookmarked,
      'isFollowing': instance.isFollowing,
      'category': instance.category,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      totalTests: (json['totalTests'] as num?)?.toInt(),
      totalQuestions: (json['totalQuestions'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      emoji: json['emoji'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalTests': instance.totalTests,
      'totalQuestions': instance.totalQuestions,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'emoji': instance.emoji,
      'image': instance.image,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: (json['id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
      answerText: json['answerText'] as String?,
      isCorrect: json['isCorrect'] as bool?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'answerText': instance.answerText,
      'isCorrect': instance.isCorrect,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      profileImage: json['profileImage'] as String?,
      isBadged: json['isBadged'] as bool?,
      isPremium: json['isPremium'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profileImage': instance.profileImage,
      'isBadged': instance.isBadged,
      'isPremium': instance.isPremium,
      'isFollowing': instance.isFollowing,
    };
