import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/data/local_source/entities/read_book_entity.dart';
import 'package:testabd/data/local_source/read_books_service.dart';
import 'package:testabd/data/remote_source/books/reading_source.dart';
import 'package:testabd/features/library/read_book_state.dart';

@injectable
class ReadBookCubit extends Cubit<ReadBookState> {
  final ReadingSource _readingSource;
  final ReadBooksService _readBooksService;
  final AppMessageHandler _messageHandler;
  final int? bookId;

  @factoryMethod
  ReadBookCubit(
    @factoryParam this.bookId,
    this._readingSource,
    this._readBooksService,
    this._messageHandler,
  ) : super(ReadBookState.initial());

  @override
  Future<void> close() {
    _readingSource.disconnectChat();
    return super.close();
  }

  Future<void> load() async {
    try {
      if (state.isLoading || bookId == null) return;

      emit(state.copyWith(isLoading: true));

      // check the data from the database
      final exists = await _readBooksService.exists(bookId!);
      if (exists) {
        final bookData = await _readBooksService.get(bookId!);

        // change the UI
        emit(
          state.copyWith(
            isLoading: false,
            bookId: bookData?.bookId,
            totalPages: bookData?.totalPages,
            currentPage: bookData?.currentPage,
            pdfPath: bookData?.pdfPath,
          ),
        );
      } else {
        // load data
        final result = await _readingSource.startSession(
          bookId: bookId!,
          mode: "solo",
        );

        if (result.id != null) {
          final data = ReadBookEntity(
            sessionId: result.id,
            bookId: bookId,
            totalPages: result.book?.totalPages,
            currentPage: 1,
            pdfPath: result.book?.pdfFile,
          );

          // save to database
          // await _readBooksService.save(data);

          _readingSource.connect(
            result.id!,
            onMessage: (data) {
              _messageHandler.handleDialog(SuccessException(data.toString()));
            },
            onConnected: () {
              _messageHandler.handleDialog(UnknownException("connected"));
            },
            onError: (error) {
              _messageHandler.handleDialog(SuccessException(error.toString()));
            },
            onDisconnected: () {
              _messageHandler.handleSnackBar(UnknownException('Disconnected!!'));
            },
          );

          // change the UI
          emit(
            state.copyWith(
              isLoading: false,
              bookId: bookId,
              totalPages: data.totalPages,
              currentPage: data.currentPage,
              pdfPath: data.pdfPath,
            ),
          );
        }
      }
    } catch (e) {
      // handel error
      _messageHandler.handleDialog(UnknownException(e.toString()));
    }
  }

  Future<void> changeThePage(int page) async {
    final data = ReadBookEntity(
      bookId: bookId,
      totalPages: state.totalPages,
      currentPage: page,
      pdfPath: state.pdfPath,
    );
    await _readBooksService.save(data);
  }
}
