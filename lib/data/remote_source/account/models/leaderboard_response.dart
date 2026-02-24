import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_response.freezed.dart';
part 'leaderboard_response.g.dart';

@freezed
class LeaderboardResponse with _$LeaderboardResponse {
  const factory LeaderboardResponse({
    int? count,
    String? next,
    String? previous,
    @Default([]) List<LeaderboardUserResponse> results,
  }) = _LeaderboardResponse;

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardResponseFromJson(json);
}

@freezed
class LeaderboardUserResponse with _$LeaderboardUserResponse {
  const factory LeaderboardUserResponse({
    int? id,
    String? username,
    String? profile_image,
    int? created_tests,
    int? coins,
    int? today_rank,
    int? yesterday_rank,
    String? rank_change,
    int? rank_change_value,
    int? tests_solved,
    double? avg_time,
    int? followers,
    int? following,
    bool? is_following,
  }) = _LeaderboardUserResponse;

  factory LeaderboardUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardUserResponseFromJson(json);
}
