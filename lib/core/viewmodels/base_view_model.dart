import 'package:flutter/foundation.dart';
import '../utils/logger.dart';

class BaseViewModel {
  final ValueNotifier<bool> _isBusy = ValueNotifier(false);
  ValueListenable<bool> get isBusy => _isBusy;

  final ValueNotifier<String?> _errorMessage = ValueNotifier(null);
  ValueListenable<String?> get errorMessage => _errorMessage;

  BaseViewModel() {
    Logger.init(runtimeType.toString());
  }

  void setBusy(bool value) {
    _isBusy.value = value;
  }

  void setError(String? message) {
    _errorMessage.value = message;
  }

  void clearError() {
    _errorMessage.value = null;
  }

  void dispose() {
    Logger.disposed(runtimeType.toString());
    _isBusy.dispose();
    _errorMessage.dispose();
  }
}
