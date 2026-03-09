import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_detail_state.freezed.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    @Default(false) bool isLoading,
    String? error,
    dynamic data,
  }) = _BookDetailState;

  factory BookDetailState.initial() {
    return const BookDetailState(
      isLoading: false,
      error: null,
      data: null,
    );
  }
}