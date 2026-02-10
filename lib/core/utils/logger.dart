import 'package:flutter/foundation.dart';

class Logger {
  static void log(String className, String message) {
    if (kDebugMode) {
      print('[$className] $message');
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
}
