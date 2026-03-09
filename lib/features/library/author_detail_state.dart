import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_detail_state.freezed.dart';

@freezed
class AuthorDetailState with _$AuthorDetailState {
  const factory AuthorDetailState({
    @Default(false) bool isLoading,
    String? error,
    dynamic data,
  }) = _AuthorDetailState;

  factory AuthorDetailState.initial() {
    return AuthorDetailState(isLoading: false, error: null, data: null);
  }
}
