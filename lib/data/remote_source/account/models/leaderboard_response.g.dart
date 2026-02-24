// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardResponseImpl _$$LeaderboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardResponseImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  LeaderboardUserResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LeaderboardResponseImplToJson(
        _$LeaderboardResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$LeaderboardUserResponseImpl _$$LeaderboardUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardUserResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      profile_image: json['profile_image'] as String?,
      created_tests: (json['created_tests'] as num?)?.toInt(),
      coins: (json['coins'] as num?)?.toInt(),
      today_rank: (json['today_rank'] as num?)?.toInt(),
      yesterday_rank: (json['yesterday_rank'] as num?)?.toInt(),
      rank_change: json['rank_change'] as String?,
      rank_change_value: (json['rank_change_value'] as num?)?.toInt(),
      tests_solved: (json['tests_solved'] as num?)?.toInt(),
      avg_time: (json['avg_time'] as num?)?.toDouble(),
      followers: (json['followers'] as num?)?.toInt(),
      following: (json['following'] as num?)?.toInt(),
      is_following: json['is_following'] as bool?,
    );

Map<String, dynamic> _$$LeaderboardUserResponseImplToJson(
        _$LeaderboardUserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profile_image': instance.profile_image,
      'created_tests': instance.created_tests,
      'coins': instance.coins,
      'today_rank': instance.today_rank,
      'yesterday_rank': instance.yesterday_rank,
      'rank_change': instance.rank_change,
      'rank_change_value': instance.rank_change_value,
      'tests_solved': instance.tests_solved,
      'avg_time': instance.avg_time,
      'followers': instance.followers,
      'following': instance.following,
      'is_following': instance.is_following,
    };
