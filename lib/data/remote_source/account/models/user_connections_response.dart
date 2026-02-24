
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_connections_response.freezed.dart';
part 'user_connections_response.g.dart';

@freezed
class UserConnectionsResponse with _$UserConnectionsResponse {
  const factory UserConnectionsResponse({
    @Default([]) List<UserConnectionItemResponse> followers,
    @Default([]) List<UserConnectionItemResponse> following,
  }) = _UserConnectionsResponse;

  factory UserConnectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionsResponseFromJson(json);
}

@freezed
class UserConnectionItemResponse with _$UserConnectionItemResponse {
  const factory UserConnectionItemResponse({
    int? id,
    String? username,
    String? first_name,
    String? last_name,
    String? profile_image,
    bool? is_following,
  }) = _UserConnectionItemResponse;

  factory UserConnectionItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionItemResponseFromJson(json);
}
