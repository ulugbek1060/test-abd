import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/books/models/start_session_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@lazySingleton
class ReadingSource {
  final Dio _dio;

  ReadingSource(this._dio);

  // ── REST ────────────────────────────────────────────────
  Future<dynamic> getMySessions() async {
    try {
      final result = await _dio.get('/books/reading-sessions/');
      return result.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<StartSessionResponse> startSession({
    required int bookId,
    required String mode,
    String? friendUsername,
  }) async {
    try {
      final body = {
        'book_id': bookId,
        'mode': mode, // "solo" | "friend" | "followers"
        if (friendUsername != null) 'friend_username': friendUsername,
      };

      final result = await _dio.post(
        '/books/reading-sessions/start_session/',
        data: body,
      );
      return StartSessionResponse.fromJson(result.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<void> joinSession(int sessionId) async {
    try {
      await _dio.post('/books/reading-sessions/$sessionId/join_session/');
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  // ── WebSocket Chat ──────────────────────────────────────
  WebSocketChannel? _channel;

  void connectToChat(
    int sessionId, {
    required Function(Map<String, dynamic>) onMessage,
    required Function() onConnected,
    required Function(dynamic) onError,
    required Function() onDisconnected,
  }) {
    final wsUrl =
        'wss://backend.testabd.uz/ws/reading/$sessionId/'; // ← confirm this !!!
    // or wss://backend.testabd.uz/ws/session/$sessionId/chat/

    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

    _channel!.stream.listen(
      (data) {
        final msg = jsonDecode(data as String) as Map<String, dynamic>;
        onMessage(msg);
      },
      onError: onError,
      onDone: onDisconnected,
    );

    // Usually connection is accepted automatically
    // Some backends send {"type": "welcome"} first
    onConnected();
  }

  void sendChatMessage(String text) {
    if (_channel == null) return;
    _channel!.sink.add(
      jsonEncode({
        'type': 'chat.message', // most common convention
        'text': text,
      }),
    );
  }

  void disconnectChat() {
    _channel?.sink.close();
    _channel = null;
  }
}
