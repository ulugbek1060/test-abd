import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/domain/books/entities/reading_session_model.dart';

abstract class SessionRepository {
  Future<Either<Messenger, dynamic>> getMySessions({
    int? page,
    int? pageSize,
  });

  Future<Either<Messenger, ReadingSessionModel>> startSession({
    required int bookId,
    required String mode,
    String? friendUsername,
  });

  Future<Either<Messenger, dynamic>> joinSession(int sessionId);

  Future<void> connect(
    int sessionId, {
    required Function(dynamic) onMessage,
    required Function() onConnected,
    required Function(dynamic) onError,
    required Function() onDisconnected,
  });

  void disconnectChat();
}
