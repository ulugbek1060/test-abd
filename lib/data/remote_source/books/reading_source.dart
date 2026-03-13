import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/services/token_service.dart';
import 'package:testabd/data/remote_source/books/models/reading_sessions_response.dart';
import 'package:testabd/data/remote_source/books/models/start_session_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@injectable
class ReadingSource {
  final Dio _dio;
  final TokenService _tokenService;

  ReadingSource(this._dio, this._tokenService);

  Future<ReadingSessionsResponse> getMySessions(
    int? page,
    int? pageSize,
  ) async {
    try {
      final result = await _dio.get(
        '/books/reading-sessions/',
        queryParameters: {
          if (page != null) 'page': page,
          if (page != null) 'page_size': pageSize,
        },
      );
      return ReadingSessionsResponse.fromJson(result.data);
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
        'mode': mode,
        // "solo" | "friend" | "followers" Show "Waiting for participants..." screen (for friend/followers)
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

  Future<dynamic> joinSession(int sessionId) async {
    try {
     final result = await _dio.post('/books/reading-sessions/$sessionId/join_session/');
     return result.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  // ── WebSocket Chat ──────────────────────────────────────
  WebSocketChannel? _channel;

  void connect(
    int sessionId, {
    required Function(dynamic) onMessage,
    required Function() onConnected,
    required Function(dynamic) onError,
    required Function() onDisconnected,
  }) async {
    final token = await _tokenService.getToken();
    final wsUrl = Uri.parse('wss://backend.testabd.uz/ws/notifications/239/');
    // final wsUrl = Uri.parse('wss://echo.websocket.org');
    // final wsUrl = Uri(
    //   scheme: 'wss',                          // ← force secure WebSocket
    //   host: 'backend.testabd.uz',
    //   path: '/ws/reading/$sessionId/',        // trailing slash matches your route
    //   // queryParameters: {'token': '${token?.access}'},  // if needed
    // );
    // or wss://backend.testabd.uz/ws/session/$sessionId/chat/

    _channel = WebSocketChannel.connect(wsUrl);

    _channel!.stream.listen(
      (data) {
        // final msg = jsonDecode(data as String) as Map<String, dynamic>;
        onMessage(data);
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
