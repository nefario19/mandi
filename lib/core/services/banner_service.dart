import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class BannerService {
  final GlobalKey<NavigatorState> _navigatorKey;

  BannerService(this._navigatorKey);

  void showSuccess({
    String? title,
    required String message,
    Duration? duration,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.check_circle_outline_rounded,
      backgroundColor: Colors.green,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void showError({
    String? title,
    required String message,
    Duration? duration,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      duration: duration ?? const Duration(seconds: 5),
    );
  }

  void showInfo({
    String? title,
    required String message,
    Duration? duration,
  }) {
    _show(
      title: title,
      message: message,
      icon: Icons.info,
      backgroundColor: Colors.blue,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void _show({
    String? title,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    Duration? duration,
  }) {
    final context = _navigatorKey.currentContext;
    if (context == null) return;

    Flushbar(
      title: title,
      message: message,
      icon: Icon(icon, color: Colors.white),
      backgroundColor: backgroundColor,
      duration: duration,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
    ).show(context);
  }

  void showSnackbar({
    required String message,
    IconData? icon,
    Duration? duration,
  }) {
    final context = _navigatorKey.currentContext;
    if (context == null) return;

    final theme = Theme.of(context);

    Flushbar(
      message: message,
      messageColor: theme.colorScheme.primary,
      icon: icon != null
          ? Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 20,
            )
          : null,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.BOTTOM,
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ).show(context);
  }
}
