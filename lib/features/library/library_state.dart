import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

part 'library_state.freezed.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState({
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default([]) List<BookModel> books,
    @Default('') String next,
    @Default('') String previous,
  }) = _LibraryState;
}
