import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

part 'read_book_state.freezed.dart';

@freezed
class ReadBookState with _$ReadBookState {
  const factory ReadBookState({
    @Default(false) bool isLoading,
    int? sessionId,
    BookModel? book,
    int? totalPages,
    int? currentPage,
    String? error,
    String? localFilePath
  }) = _ReadBookState;

  factory ReadBookState.initial() => ReadBookState();
}
