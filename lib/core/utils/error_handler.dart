import 'dart:async';
import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/models/app_error.dart';

class ErrorHandler {
  static AppError handleException(
    dynamic exception,
    StackTrace stackTrace,
  ) {
    if (exception is AppError) {
      return exception;
    }

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
    // ✅ SESSION EXPIRED (only specific types!)
    if (_isSessionExpired(e)) {
      return AppError.sessionExpired(stackTrace: stackTrace);
    }

    // ✅ INVALID CREDENTIALS (login failed)
    if (e.code == 401 && e.type?.contains('credentials') == true) {
      return AppError.invalidCredentials(stackTrace: stackTrace);
    }

    // ✅ UNAUTHORIZED (permissions - NOT session!)
    if (e.code == 401 || e.code == 403) {
      return AppError.unauthorized(
        details: e.message ?? 'Permission denied',
        stackTrace: stackTrace,
      );
    }

    // Storage errors (400)
    if (e.code == 400) {
      if (e.type?.contains('storage') ?? false) {
        if (e.type!.contains('size')) {
          return AppError.fileTooLarge(stackTrace: stackTrace);
        }
        return AppError.invalidFileType(stackTrace: stackTrace);
      }
      return AppError.validation(
        field: 'unknown',
        reason: e.message ?? 'Invalid request',
        stackTrace: stackTrace,
      );
    }

    // Not found (404)
    if (e.code == 404) {
      return AppError.fileNotFound(stackTrace: stackTrace);
    }

    // Rate limit (429)
    if (e.code == 429) {
      return AppError.rateLimitExceeded(stackTrace: stackTrace);
    }

    // Server errors (500+)
    if (e.code != null && e.code! >= 500) {
      return AppError.serverError(
        details: '${e.code}: ${e.message}',
        stackTrace: stackTrace,
      );
    }

    // Unknown
    return AppError.serverError(
      details: '${e.code}: ${e.message}',
      stackTrace: stackTrace,
    );
  }

  // ✅ Helper: Check if it's REALLY a session expired error
  static bool _isSessionExpired(AppwriteException e) {
    if (e.code != 401) return false;

    // Check for specific session-related error types
    const sessionErrorTypes = [
      'user_invalid_token',
      'user_session_not_found',
      'user_jwt_invalid',
      'general_unauthorized_scope',
    ];

    // Check type
    if (e.type != null && sessionErrorTypes.contains(e.type)) {
      return true;
    }

    // Check message for session/token keywords (fallback)
    final message = (e.message ?? '').toLowerCase();
    if (message.contains('session')) return true;
    if (message.contains('token') && message.contains('expired')) return true;
    if (message.contains('token') && message.contains('invalid')) return true;

    // If none of the above, it's probably NOT a session error
    return false;
  }
}
