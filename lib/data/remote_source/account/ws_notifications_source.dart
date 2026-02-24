import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:testabd/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class WSNotificationsSource {
  Future<void> connectWebSocket(
    int userId,
    void Function(dynamic message) onData,
  );

  Future<void> closeWebSocket();
}

@LazySingleton(as: WSNotificationsSource)
class WSNotificationsSourceImpl implements WSNotificationsSource {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  @override
  Future<void> connectWebSocket(
    int userId,
    void Function(dynamic message) onData,
  ) async {
    await closeWebSocket();

    logger.d(userId);
    final uri = Uri.parse('wss://backend.testabd.uz/ws/notifications/$userId/');

    _channel = WebSocketChannel.connect(
      uri,
    );

    _subscription = _channel!.stream.listen(
      (message) {
        onData(message);
      },
      onError: (error) {
        logger.e(error);
      },
      onDone: () {
        logger.d("Notification socket done");
      },
      cancelOnError: true,
    );
  }

  @override
  Future<void> closeWebSocket() async {
    await _subscription?.cancel();
    await _channel?.sink.close();
    _subscription = null;
    _channel = null;
  }
}
