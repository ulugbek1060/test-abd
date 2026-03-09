import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/books/books_repository.dart';
import 'package:testabd/features/library/book_detail_state.dart';

@injectable
class BookDetailCubit extends Cubit<BookDetailState> {
  final BooksRepository _booksRepository;
  final AppMessageHandler _messageHandler;
  final int? bookId;

  @factoryMethod
  BookDetailCubit(
    @factoryParam this.bookId,
    this._booksRepository,
    this._messageHandler,
  ) : super(BookDetailState.initial());

  Future<void> getBook() async {
    if (state.isLoading || bookId == null) return;

    emit(state.copyWith(isLoading: true));

    final result = await _booksRepository.getBookById(bookId!);
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);

        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(state.copyWith(isLoading: false, error: null, data: value));
      },
    );
  }
}
