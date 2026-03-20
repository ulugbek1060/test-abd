import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testabd/l10n/l10n_extension.dart';

extension DioExceptionTypeX on DioException {
  Messenger handleDioException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutErrorMsg("Connection timed out", stackTrace: stackTrace);

      case DioExceptionType.connectionError:
        return NetworkErrorMsg(
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
          return BadRequestMsg(
            errorMessage ?? "Bad request",
            code: status,
            stackTrace: stackTrace,
          );
        } else if (status == 401) {
          return UnauthorizedMsg(
            "Unauthorized access",
            code: status,
            stackTrace: stackTrace,
          );
        } else if (status == 404) {
          return NotFoundMsg("Resource not found");
        } else if (status != null && status >= 500) {
          return ServerErrorMsg(
            "Server error",
            code: status,
            stackTrace: stackTrace,
          );
        }

        return ServerErrorMsg(
          "Unexpected server error",
          code: status,
          stackTrace: stackTrace,
        );

      case DioExceptionType.cancel:
        return UnknownErrorMsg("Request cancelled", stackTrace: stackTrace);

      case DioExceptionType.badCertificate:
        return UnknownErrorMsg("Bad SSL Certificate", stackTrace: stackTrace);

      case DioExceptionType.unknown:
        if (message?.contains("SocketException") ?? false) {
          return NetworkErrorMsg(
            "No Internet connection",
            stackTrace: stackTrace,
          );
        }
        return UnknownErrorMsg(
          message ?? "Unknown error",
          stackTrace: stackTrace,
        );
    }
  }
}

@immutable
abstract class AppErrorBase implements Exception {}

abstract class Messenger implements AppErrorBase {
  final String message;
  final StackTrace? stackTrace;

  const Messenger(this.message, {this.stackTrace});

  @override
  String toString() => "$runtimeType: $message (stack trace: $stackTrace)";
}

enum MessageType { info, success, warning, error }

extension MessageTypeX on MessageType {
  Color getColor(BuildContext context) {
    switch (this) {
      case MessageType.success:
        return Colors.green;
      case MessageType.warning:
        return Colors.orange;
      case MessageType.error:
        return Theme.of(context).colorScheme.error;
      case MessageType.info:
        return Theme.of(context).colorScheme.primary;
    }
  }

  IconData get icon {
    switch (this) {
      case MessageType.success:
        return Icons.check_circle_outline;
      case MessageType.warning:
        return Icons.warning_amber_rounded;
      case MessageType.error:
        return Icons.error_outline;
      case MessageType.info:
        return Icons.info_outline;
    }
  }
}

extension MessageTypeXOnAppException on Messenger {
  MessageType getMessageType() {
    switch (runtimeType) {
      case NetworkErrorMsg _:
      case TimeoutErrorMsg _:
        return MessageType.warning;
      case BadRequestMsg _:
        return MessageType.warning;
      case UnauthorizedMsg _:
        return MessageType.error;
      case NotFoundMsg _:
        return MessageType.info;
      case ServerErrorMsg _:
        return MessageType.error;
      case HiveErrorMsg _:
        return MessageType.error;
      case UnknownErrorMsg _:
      default:
        return MessageType.error;
    }
  }

  String title(BuildContext context) {
    return switch (this) {
      NetworkErrorMsg() => context.l10n.error_timeout_title,
      TimeoutErrorMsg() => context.l10n.error_timeout_title,
      BadRequestMsg() => context.l10n.error_bad_request_title,
      UnauthorizedMsg() => context.l10n.error_unauthorized_title,
      NotFoundMsg() => context.l10n.error_not_found_title,
      ServerErrorMsg() => context.l10n.error_server_title,
      HiveErrorMsg() => context.l10n.error_storage_title,
      UnknownErrorMsg() => context.l10n.error_unknown_title,
      SuccessMsg() => "Success",
      _ => "Error",
    };
  }
}

class SuccessMsg extends Messenger {
  SuccessMsg(super.message);
}

class NetworkErrorMsg extends Messenger {
  const NetworkErrorMsg(super.message, {super.stackTrace});
}

class TimeoutErrorMsg extends Messenger {
  const TimeoutErrorMsg(super.message, {super.stackTrace});
}

class ServerErrorMsg extends Messenger {
  final int? code;

  const ServerErrorMsg(super.message, {this.code, super.stackTrace});
}

class BadRequestMsg extends Messenger {
  final int? code;

  const BadRequestMsg(super.message, {this.code, super.stackTrace});
}

class UnauthorizedMsg extends Messenger {
  final int? code;

  const UnauthorizedMsg(super.message, {this.code, super.stackTrace});
}

class NotFoundMsg extends Messenger {
  const NotFoundMsg(super.message, {super.stackTrace});
}

class UnknownErrorMsg extends Messenger {
  const UnknownErrorMsg(super.message, {super.stackTrace});
}

class HiveErrorMsg extends Messenger {
  HiveErrorMsg(super.message, {super.stackTrace});
}
