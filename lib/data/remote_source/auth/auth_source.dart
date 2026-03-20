import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/auth/models/login_response.dart';
import 'package:testabd/data/remote_source/auth/models/user_register_response.dart';

abstract class AuthSource {
  Future<UserRegisterResponse> register(String username, String email, String password, String? referralCode,);
  Future<LoginResponse> login(String username, String password);
  Future<dynamic> resendVerificationEmail(String email);
  Future<dynamic> logout();
}

@Injectable(as: AuthSource)
class AuthSourceImpl implements AuthSource {

  final Dio _dio;

  AuthSourceImpl(this._dio);

  /// /accounts/register/
  @override
  Future<UserRegisterResponse> register(
    String username,
    String email,
    String password,
    String? referralCode,
  ) async {
    try {
      final response = await _dio.post(
        "/accounts/register/",
        data: {
          "username": username,
          "email": email,
          "password": password,
          if (referralCode != null) "referral_code": referralCode,
        },
      );
      return UserRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw BadRequestMsg(
          e.response?.data['username'].toString() ?? "Unknown error",
        );
      }
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  /// /accounts/login/
  @override
  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post(
        "/accounts/login/",
        data: {"username": username, "password": password},
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  /// /accounts/resend-verification-email/{email}/
  @override
  Future<dynamic> resendVerificationEmail(String email) async {
    try {
      final response = await _dio.post(
        "/accounts/resend-verification-email/$email/",
      );
      return response.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  /// /accounts/logout/
  @override
  Future<dynamic> logout() async {
    try {
      final response = await _dio.post("/accounts/logout/");
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw BadRequestMsg(e.response?.data['detail']);
      }
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }
}
