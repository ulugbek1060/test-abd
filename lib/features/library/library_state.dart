import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/books/entities/author_model.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

part 'library_state.freezed.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState({
    String? error,
    @Default(BooksState()) BooksState booksState,
    @Default(AuthorsState()) AuthorsState authorsState,
  }) = _LibraryState;
}

@freezed
class BooksState with _$BooksState {
  const factory BooksState({
    String? error,
    @Default([]) List<BookModel> books,
    String? next,
    String? previous,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
  }) = _BooksState;
}

@freezed
class AuthorsState with _$AuthorsState {
  const factory AuthorsState({
    String? error,
    @Default([]) List<AuthorModel> authors,
    String? next,
    String? previous,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
  }) = _AuthorsState;
}
