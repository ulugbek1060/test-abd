import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/data/local_source/entities/read_book_entity.dart';
import 'package:testabd/data/local_source/read_books_service.dart';
import 'package:testabd/domain/books/books_repository.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/domain/books/session_repository.dart';
import 'package:testabd/features/library/read_book_state.dart';
import 'package:testabd/main.dart';

@injectable
class ReadBookCubit extends Cubit<ReadBookState> {
  final SessionRepository _sessionRepository;
  final BooksRepository _booksRepository;
  final ReadBooksService _readBooksService;
  final AppMessageHandler _messageHandler;
  final Dio _dio;
  final int? bookId;

  @factoryMethod
  ReadBookCubit(
    @factoryParam this.bookId,
    this._dio,
    this._sessionRepository,
    this._booksRepository,
    this._readBooksService,
    this._messageHandler,
  ) : super(ReadBookState.initial());

  @override
  Future<void> close() {
    _sessionRepository.disconnectChat();
    return super.close();
  }

  Future<void> load() async {
    try {
      if (state.isLoading || bookId == null) return;

      emit(state.copyWith(isLoading: true));

      await Future.delayed(Duration(seconds: 2));

      // check the data from the database
      final exists = await _readBooksService.exists(bookId!);

      if (exists) {
        final session = await _readBooksService.get(bookId!);
        final result = await _booksRepository.getBookById(session?.bookId ?? 0);
        final localFilePath = await _loadPdf(session?.pdfPath ?? "");

        result.fold(
          (error) {
            _messageHandler.handleDialog(error);
            emit(
              state.copyWith(
                isLoading: false,
                error: error.message,
                totalPages: session?.totalPages,
                currentPage: session?.currentPage,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                isLoading: false,
                error: null,
                book: BookModel.fromBookDetailModel(value),
                totalPages: session?.totalPages,
                currentPage: session?.currentPage,
                initialPage: session?.currentPage ?? 1,
                localFilePath: localFilePath,
              ),
            );
          },
        );

        // change the UI
      } else {
        // load data
        final result = await _sessionRepository.startSession(
          bookId: bookId!,
          mode: "solo",
          // friendUsername: "KAXXOROV"
        );
        result.fold(
          (error) {
            _messageHandler.handleDialog(error);
          },
          (session) async {
            final data = ReadBookEntity(
              sessionId: session.id,
              bookId: session.book?.id,
              totalPages: session.book?.totalPages,
              currentPage: 1,
              pdfPath: session.book?.pdfFile,
            );

            // save to database
            await _readBooksService.save(data);

            // load pdf file
            final localFilePath = await _loadPdf(session.book?.pdfFile ?? "");

            _sessionRepository.connect(
              session.id!,
              onMessage: (data) {
                _messageHandler.handleDialog(SuccessMsg(data.toString()));
              },
              onConnected: () {
                _messageHandler.handleDialog(UnknownErrorMsg("connected"));
              },
              onError: (error) {
                _messageHandler.handleDialog(
                  SuccessMsg(error.toString()),
                );
              },
              onDisconnected: () {
                _messageHandler.handleSnackBar(
                  UnknownErrorMsg('Disconnected!!'),
                );
              },
            );

            // change the UI
            emit(
              state.copyWith(
                isLoading: false,
                book: session.book,
                totalPages: session.book?.totalPages,
                currentPage: data.currentPage,
                localFilePath: localFilePath,
              ),
            );
          },
        );
      }
    } catch (e) {
      // handel error
      _messageHandler.handleDialog(UnknownErrorMsg(e.toString()));
    }
  }

  Future<String?> _loadPdf(String pdfUrl) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = Uri.parse(pdfUrl).pathSegments.lastWhere(
        (segment) => segment.isNotEmpty,
        orElse: () => 'temp_book_${DateTime.now().millisecondsSinceEpoch}.pdf',
      );

      final file = File('${tempDir.path}/$fileName');
      logger.d('Target PDF path: ${file.path}');

      // Already exists → return it
      if (await file.exists()) {
        logger.d('PDF already exists locally → using cached file');
        return file.path;
      }

      logger.d('Downloading PDF from: $pdfUrl');

      final response = await _dio.get(
        pdfUrl,
        options: Options(
          responseType: ResponseType.bytes, // VERY IMPORTANT for binary files!
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode != 200) {
        logger.e('Download failed with status: ${response.statusCode}');
        return null;
      }

      // Write bytes to file
      final bytes = response.data as List<int>;
      await file.writeAsBytes(bytes, flush: true);

      logger.d(
        'PDF downloaded successfully → ${file.path} (${bytes.length} bytes)',
      );

      return file.path;
    } catch (e, stackTrace) {
      logger.e('Error downloading PDF', error: e, stackTrace: stackTrace);
      // You can also show toast/snackbar here if in UI context
      return null;
    }
  }

  void onPageChanged({int? page, required VoidCallback onNavigate}) async {
    if (page == null || state.book?.id == null) return;
    _readBooksService.updatePage(state.book!.id!, page);
    emit(state.copyWith(currentPage: page));
    if (page != 1 && page % 10 == 1) onNavigate();
  }
}
