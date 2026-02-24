// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsResponseImpl _$$NotificationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationsResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      verb: json['verb'] as String?,
      message: json['message'] as String?,
      actor: json['actor'],
      contentType: json['content_type'],
      objectId: json['object_id'],
      createdAt: json['created_at'] as String?,
      isRead: json['is_read'] as bool?,
    );

Map<String, dynamic> _$$NotificationsResponseImplToJson(
        _$NotificationsResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verb': instance.verb,
      'message': instance.message,
      'actor': instance.actor,
      'content_type': instance.contentType,
      'object_id': instance.objectId,
      'created_at': instance.createdAt,
      'is_read': instance.isRead,
    };
