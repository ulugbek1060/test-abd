import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testabd/core/app_constants.dart';
import 'package:testabd/core/utils/dio_interceptor.dart';

@module
abstract class AppModule {

  @singleton
  @preResolve
  Future<SharedPreferences> getSharedPrefs() => SharedPreferences.getInstance();

  @lazySingleton
  BaseOptions provideDioBaseOptions() => BaseOptions(
    baseUrl: AppConstants.BASE_URL,
    connectTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 5),
  );

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() => PrettyDioLogger(
    requestHeader: true,
    requestBody: false,
    responseHeader: false,
    responseBody: false,
  );

  Dio provideDio(
    BaseOptions options,
    DioInterceptor dioInterceptor,
    PrettyDioLogger prettyDioLogger,
  ) => Dio(options)
    ..interceptors.add(dioInterceptor)
    ..interceptors.add(prettyDioLogger);

}
