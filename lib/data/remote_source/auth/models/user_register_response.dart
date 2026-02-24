import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_response.freezed.dart';
part 'user_register_response.g.dart';

@freezed
class UserRegisterResponse with _$UserRegisterResponse {
  const factory UserRegisterResponse({
    int? id,
    required String username,
    String? email,
    required String password,
    String? token,
    @JsonKey(name: 'referral_code') String? referralCode,
  }) = _UserRegisterResponse;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json)
  => _$UserRegisterResponseFromJson(json);
}
