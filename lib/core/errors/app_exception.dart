import 'package:dio/dio.dart';

extension DioExceptionTypeX on DioException {
  AppException handleDioException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException("Connection timed out", stackTrace: stackTrace);

      case DioExceptionType.connectionError:
        return NetworkException(
          "No internet connection",
          stackTrace: stackTrace,
        );

      case DioExceptionType.badResponse:
        final status = response?.statusCode;
        final data = response?.data;

        String? errorMessage;

        if (data is Map<String, dynamic>) {
          errorMessage =
              data['detail']?.toString() ??
                  data['message']?.toString() ??
                  data['error']?.toString();
        } else if (data is String) {
          errorMessage = data;
        }

        if (status == 400) {
          return BadRequestException(
            errorMessage ?? "Bad request",
            code: status,
            stackTrace: stackTrace,
          );
        } else if (status == 401) {
          return UnauthorizedException(
            "Unauthorized access",
            code: status,
            stackTrace: stackTrace,
          );
        } else if (status == 404) {
          return NotFoundException("Resource not found");
        } else if (status != null && status >= 500) {
          return ServerException(
            "Server error",
            code: status,
            stackTrace: stackTrace,
          );
        }

        return ServerException(
          "Unexpected server error",
          code: status,
          stackTrace: stackTrace,
        );

      case DioExceptionType.cancel:
        return UnknownException("Request cancelled", stackTrace: stackTrace);

      case DioExceptionType.badCertificate:
        return UnknownException("Bad SSL Certificate", stackTrace: stackTrace);

      case DioExceptionType.unknown:
        if (message?.contains("SocketException") ?? false) {
          return NetworkException(
            "No Internet connection",
            stackTrace: stackTrace,
          );
        }
        return UnknownException(
          message ?? "Unknown error",
          stackTrace: stackTrace,
        );
    }
  }
}

abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.stackTrace});

  @override
  String toString() => "$runtimeType: $message (stack trace: $stackTrace)";
}
class SuccessException extends AppException {
  SuccessException(super.message);
}
class NetworkException extends AppException {
  const NetworkException(super.message, {super.stackTrace});
}
class TimeoutException extends AppException {
  const TimeoutException(super.message, {super.stackTrace});
}
class ServerException extends AppException {
  final int? code;
  const ServerException(super.message, {this.code, super.stackTrace});
}
class BadRequestException extends AppException {
  final int? code;

  const BadRequestException(super.message, {this.code, super.stackTrace});
}
class UnauthorizedException extends AppException {
  final int? code;

  const UnauthorizedException(super.message, {this.code, super.stackTrace});
}
class NotFoundException extends AppException {
  const NotFoundException(super.message, {super.stackTrace});
}
class UnknownException extends AppException {
  const UnknownException(super.message, {super.stackTrace});
}
class HiveError extends AppException {
  HiveError(super.message, {super.stackTrace});
}
