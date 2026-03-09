import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/books/entities/book_detail_model.dart';

part 'book_detail_state.freezed.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState({
    @Default(false) bool isLoading,
    String? error,
    BookDetailModel? data,
  }) = _BookDetailState;

  factory BookDetailState.initial() {
    return const BookDetailState(
      isLoading: false,
      error: null,
      data: null,
    );
  }
}