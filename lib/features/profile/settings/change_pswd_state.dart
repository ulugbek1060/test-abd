import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pswd_state.freezed.dart';

@freezed
class ChangePswdState with _$ChangePswdState {
  const factory ChangePswdState({
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isEditModel,
  }) = _ChangePswdState;
}
