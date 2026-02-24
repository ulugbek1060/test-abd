import 'package:freezed_annotation/freezed_annotation.dart';

part 'referrals_list_response.freezed.dart';
part 'referrals_list_response.g.dart';

@freezed
class ReferralsListResponse with _$ReferralsListResponse {
  const factory ReferralsListResponse({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') List<Referral>? results,
  }) = _ReferralsListResponse;

  factory ReferralsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralsListResponseFromJson(json);
}

@freezed
class Referral with _$Referral {
  const factory Referral({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'referred') Referred? referred,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) =>
      _$ReferralFromJson(json);
}

@freezed
class Referred with _$Referred {
  const factory Referred({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'is_following') bool? isFollowing,
  }) = _Referred;

  factory Referred.fromJson(Map<String, dynamic> json) =>
      _$ReferredFromJson(json);
}
