// lib/core/utils/error_handler.dart

import 'dart:async';
import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/models/app_error.dart';
import 'package:mandi/core/utils/logger.dart';

class ErrorHandler {
  static AppError handleException(
    dynamic exception,
    StackTrace stackTrace,
  ) {
    if (exception is AppwriteException) {
      return _handleAppwriteException(exception, stackTrace);
    } else if (exception is SocketException) {
      return AppError.network(
        details: exception.message,
        stackTrace: stackTrace,
      );
    } else if (exception is TimeoutException) {
      return AppError.timeout(
        details: exception.message,
        stackTrace: stackTrace,
      );
    } else {
      return AppError.unknown(
        details: exception.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static AppError _handleAppwriteException(
    AppwriteException e,
    StackTrace stackTrace,
  ) {
    if (e.code == 401) {
      if (e.type?.contains('credentials') ?? false) {
        return AppError.invalidCredentials(stackTrace: stackTrace);
      }
      return AppError.sessionExpired(stackTrace: stackTrace);
    }

    if (e.code == 429) {
      return AppError.rateLimitExceeded(stackTrace: stackTrace);
    }

    return AppError.serverError(
      details: '${e.code}: ${e.message}',
      stackTrace: stackTrace,
    );
  }
}
