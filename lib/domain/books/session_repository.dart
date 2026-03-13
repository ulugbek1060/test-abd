import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/domain/books/entities/reading_session_model.dart';

abstract class SessionRepository {
  Future<Either<AppException, dynamic>> getMySessions({
    int? page,
    int? pageSize,
  });

  Future<Either<AppException, ReadingSessionModel>> startSession({
    required int bookId,
    required String mode,
    String? friendUsername,
  });

  Future<Either<AppException, dynamic>> joinSession(int sessionId);

  Future<void> connect(
    int sessionId, {
    required Function(dynamic) onMessage,
    required Function() onConnected,
    required Function(dynamic) onError,
    required Function() onDisconnected,
  });

  void disconnectChat();
}
