import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/services/token_service.dart';
import 'package:testabd/data/remote_source/account/models/leaderboard_response.dart';
import 'package:testabd/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class LeaderboardSocketService {
  Future<void> connectWebSocket(Function(dynamic data) dataReceived);
  Future<void> closeWebSocket();
}

abstract class WsLeaderboardSource {
  Future<LeaderboardResponse> getLeaderboard(int page, int pageSize);
}

@Injectable(as: WsLeaderboardSource)
class WsLeaderboardSourceImpl implements WsLeaderboardSource {
  final Dio _dio;

  WsLeaderboardSourceImpl(this._dio);

  /// /accounts/leaderboard/?page=1
  @override
  Future<LeaderboardResponse> getLeaderboard(int page, int pageSize) async {
    try {
      final response = await _dio.get(
        "/accounts/leaderboard/",
        queryParameters: {"page": page, "page_size": pageSize},
      );
      return LeaderboardResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }
}

@Singleton(as: LeaderboardSocketService)
class LeaderboardSocketServiceImpl implements LeaderboardSocketService {
  WebSocketChannel? _channel;
  final TokenService _tokenService;

  LeaderboardSocketServiceImpl(this._tokenService);


  @override
  Future<void> connectWebSocket(
    Function(dynamic data) dataReceived,
  ) async {
    logger.d('-------------- Websocket connected -----------------');
    // final tokenData = await _tokenService.getToken();
    // final token = tokenData?.access;
    _channel = WebSocketChannel.connect(
      Uri.parse(
        'wss://backend.testabd.uz/ws/leaderboard/',
      ),
    );
    _channel!.stream.listen((message) {
      dataReceived(message);
    });
  }

  @override
  Future<void> closeWebSocket() async {
    if (_channel != null) {
      await _channel!.sink.close();
      _channel = null;
    }
  }
}
