
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.freezed.dart';
part 'user_profile_response.g.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    UserData? user,
    UserStats? stats,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    int? id,
    String? username,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? bio,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'is_following') bool? isFollowing,
    String? level,
    @JsonKey(name: 'join_date') String? joinDate,
    int? coins,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @JsonKey(name: 'total_tests') int? totalTests,
    @JsonKey(name: 'correct_answers') int? correctAnswers,
    @JsonKey(name: 'wrong_answers') int? wrongAnswers,
    double? accuracy,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
