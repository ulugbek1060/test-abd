import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_book_state.freezed.dart';

@freezed
class ReadBookState with _$ReadBookState {
  const factory ReadBookState({
    @Default(false) bool isLoading,
    int? bookId,
    int? totalPages,
    int? currentPage,
    String? pdfPath,
    String? error,
  }) = _ReadBookState;

  factory ReadBookState.initial() => ReadBookState();
}
