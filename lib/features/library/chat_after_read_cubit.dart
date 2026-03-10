// chat_cubit.dart
import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/features/library/chat_after_read_state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@injectable
class ChatAfterReadCubit extends Cubit<ChatAfterReadState> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  final String bookId; // or some identifier for the book/discussion room
  final String userId; // current user's ID (you can get from auth)

  ChatAfterReadCubit({required this.bookId, required this.userId})
    : super(const ChatAfterReadState());

  void connect() {
    if (state.isConnecting || state.isConnected) return;

    emit(state.copyWith(isConnecting: true));

    // Replace with your real WebSocket URL
    // Example: wss://backend.testabd.uz/ws/chat/$bookId?user=$userId
    final wsUrl = 'wss://your-backend-domain/ws/chat/$bookId?user=$userId';

    try {
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      _subscription = _channel!.stream.listen(
        (data) {
          final message = jsonDecode(data as String);
          final chatMsg = ChatMessage(
            senderId: message['senderId'] ?? 'unknown',
            content: message['content'] ?? '',
            timestamp: DateTime.now(),
          );

          emit(
            state.copyWith(
              messages: [...state.messages, chatMsg],
              isConnecting: false,
              isConnected: true,
            ),
          );
        },
        onError: (error) {
          emit(
            state.copyWith(
              error: error.toString(),
              isConnecting: false,
              isConnected: false,
            ),
          );
        },
        onDone: () {
          emit(state.copyWith(isConnected: false, error: 'Connection closed'));
        },
      );

      emit(state.copyWith(isConnecting: false, isConnected: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isConnecting: false));
    }
  }

  void sendMessage(String text) {
    if (!_isConnected() || text.trim().isEmpty) return;

    final payload = jsonEncode({
      'type': 'message',
      'content': text,
      'senderId': userId,
      'bookId': bookId,
      'timestamp': DateTime.now().toIso8601String(),
    });

    _channel?.sink.add(payload);
  }

  bool _isConnected() => state.isConnected && _channel != null;

  @override
  Future<void> close() {
    _subscription?.cancel();
    _channel?.sink.close();
    return super.close();
  }
}
