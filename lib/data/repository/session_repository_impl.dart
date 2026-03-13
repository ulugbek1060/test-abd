import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/data/remote_source/books/reading_source.dart';
import 'package:testabd/domain/books/entities/reading_session_model.dart';
import 'package:testabd/domain/books/session_repository.dart';

@Injectable(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final ReadingSource _readingSource;

  SessionRepositoryImpl(this._readingSource);

  @override
  Future<void> connect(
    int sessionId, {
    required Function(dynamic) onMessage,
    required Function() onConnected,
    required Function(dynamic) onError,
    required Function() onDisconnected,
  }) async => _readingSource.connect(
    sessionId,
    onMessage: onMessage,
    onConnected: onConnected,
    onError: onError,
    onDisconnected: onDisconnected,
  );

  @override
  void disconnectChat() => _readingSource.disconnectChat();

  @override
  Future<Either<AppException, PagedData<ReadingSessionModel>>> getMySessions({
    int? page,
    int? pageSize,
  }) async {
    try {
      final result = await _readingSource.getMySessions(page, pageSize);
      final data = PagedData(
        data: result.results.map(ReadingSessionModel.fromResponse).toList(),
        next: result.next,
        previous: result.previous,
        count: result.count,
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, dynamic>> joinSession(int sessionId) async {
    try {
      final result = await _readingSource.joinSession(sessionId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, ReadingSessionModel>> startSession({
    required int bookId,
    required String mode,
    String? friendUsername,
  }) async {
    try {
      final result = await _readingSource.startSession(
        bookId: bookId,
        mode: mode,
        friendUsername: friendUsername,
      );
      return Right(ReadingSessionModel.fromStartSessionResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }
}
