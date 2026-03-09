import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/books/books_repository.dart';
import 'package:testabd/features/library/library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final BooksRepository _booksRepository;
  final AppMessageHandler _messageHandler;

  LibraryCubit(this._booksRepository, this._messageHandler)
    : super(LibraryState());

  Future<void> refresh() async {
    await getAuthor();
    await getBooks();
  }

  Future<void> getAuthor() async {
    if (state.authorsState.isLoading) return;
    emit(
      state.copyWith(
        authorsState: state.authorsState.copyWith(isLoading: true),
      ),
    );

    final result = await _booksRepository.getAuthors();
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            authorsState: state.authorsState.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            authorsState: state.authorsState.copyWith(
              isLoading: false,
              error: null,
              authors: value.data,
            ),
          ),
        );
      },
    );
  }

  Future<void> getBooks() async {
    if (state.booksState.isLoading) return;

    emit(
      state.copyWith(booksState: state.booksState.copyWith(isLoading: true)),
    );

    final result = await _booksRepository.getBooks();
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(
          state.copyWith(
            booksState: state.booksState.copyWith(isLoading: false),
          ),
        );
      },
      (value) {
        emit(
          state.copyWith(
            booksState: state.booksState.copyWith(
              isLoading: false,
              error: null,
              books: value.data,
            ),
          ),
        );
      },
    );
  }
}
