import 'package:flutter/foundation.dart';
import 'package:mandi/core/models/app_error.dart';

class Logger {
  static void log(String className, String message) {
    if (kDebugMode) {
      print('[${className.toString()}] $message');
    }
  }

  static void init(String className) {
    log(className, '🟢 INITIALIZED');
  }

  static void disposed(String className) {
    log(className, '🔴 DISPOSED');
  }

  static void success(String className, String message) {
    log(className, '✅ $message');
  }

  static void error(String className, String message) {
    log(className, '❌ $message');
  }

  static void info(String className, String message) {
    log(className, 'ℹ️  $message');
  }

  static void logAppError(String className, AppError error, {StackTrace? stackTrace}) {
    final message = '${error.type.name}: ${error.message}'
        '${error.technicalDetails != null ? '\n  │ Details: ${error.technicalDetails}' : ''}'
        '${error.statusCode != null ? '\n  │ Status: ${error.statusCode}' : ''}';

    Logger.error(className, message);

    if (stackTrace != null || error.stackTrace != null) {
      final trace = stackTrace ?? error.stackTrace;
      log(className, '  │ Stack: ${trace.toString().split('\n').take(3).join('\n  │ ')}');
    }
  }
}
