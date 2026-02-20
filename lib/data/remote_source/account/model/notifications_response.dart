import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_response.freezed.dart';
part 'notifications_response.g.dart';

@freezed
class NotificationsResponse with _$NotificationsResponse {
  const factory NotificationsResponse({
    int? id,
    String? verb,
    String? message,
    dynamic actor,
    @JsonKey(name: 'content_type') dynamic contentType,
    @JsonKey(name: 'object_id') dynamic objectId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_read') bool? isRead,
  }) = _NotificationsResponse;

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
}
