import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pswd_response.freezed.dart';
part 'change_pswd_response.g.dart';

@freezed
class ChangePswdResponse with _$ChangePswdResponse {
  const factory ChangePswdResponse({
    @JsonKey(name: 'detail') String? detail,
  }) = _ChangePswdResponse;

  factory ChangePswdResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePswdResponseFromJson(json);
}
