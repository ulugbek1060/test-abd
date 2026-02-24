// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileResponseImpl _$$UserProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseImpl(
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : UserStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileResponseImplToJson(
        _$UserProfileResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'stats': instance.stats,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      bio: json['bio'] as String?,
      profileImage: json['profile_image'] as String?,
      followersCount: (json['followers_count'] as num?)?.toInt(),
      followingCount: (json['following_count'] as num?)?.toInt(),
      isFollowing: json['is_following'] as bool?,
      level: json['level'] as String?,
      joinDate: json['join_date'] as String?,
      coins: (json['coins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'bio': instance.bio,
      'profile_image': instance.profileImage,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'is_following': instance.isFollowing,
      'level': instance.level,
      'join_date': instance.joinDate,
      'coins': instance.coins,
    };

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      totalTests: (json['total_tests'] as num?)?.toInt(),
      correctAnswers: (json['correct_answers'] as num?)?.toInt(),
      wrongAnswers: (json['wrong_answers'] as num?)?.toInt(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'total_tests': instance.totalTests,
      'correct_answers': instance.correctAnswers,
      'wrong_answers': instance.wrongAnswers,
      'accuracy': instance.accuracy,
    };
