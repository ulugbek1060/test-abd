// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_connections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserConnectionsResponseImpl _$$UserConnectionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserConnectionsResponseImpl(
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => UserConnectionItemResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => UserConnectionItemResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserConnectionsResponseImplToJson(
        _$UserConnectionsResponseImpl instance) =>
    <String, dynamic>{
      'followers': instance.followers,
      'following': instance.following,
    };

_$UserConnectionItemResponseImpl _$$UserConnectionItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserConnectionItemResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      profile_image: json['profile_image'] as String?,
      is_following: json['is_following'] as bool?,
    );

Map<String, dynamic> _$$UserConnectionItemResponseImplToJson(
        _$UserConnectionItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'profile_image': instance.profile_image,
      'is_following': instance.is_following,
    };
