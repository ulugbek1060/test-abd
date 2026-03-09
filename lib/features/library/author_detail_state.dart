import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/books/entities/author_detail_model.dart';

part 'author_detail_state.freezed.dart';

@freezed
class AuthorDetailState with _$AuthorDetailState {
  const factory AuthorDetailState({
    @Default(false) bool isLoading,
    String? error,
    AuthorDetailModel? data,
  }) = _AuthorDetailState;

  factory AuthorDetailState.initial() {
    return AuthorDetailState(isLoading: false, error: null, data: null);
  }
}
