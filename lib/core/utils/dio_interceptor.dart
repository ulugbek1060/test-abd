import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/services/token_service.dart';

@singleton
class DioInterceptor extends Interceptor {
  final TokenService _tokenService;

  DioInterceptor(this._tokenService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenService.getToken();
    options.headers['Content-Type'] = 'application/json';
    options.headers['X-Mobile-Key'] = 'gyp32aue63+oawwcvhit7zhlm\$2e1w+@8-q*&m=g+y2)%lxuuj';
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.access}';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // refresh token
    super.onError(err, handler);
  }
}
