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

  Future<void> getBooks() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _booksRepository.getBooks();
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(state.copyWith(isLoading: false, error: null, books: value.data));
      },
    );
  }
}
