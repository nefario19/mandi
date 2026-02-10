import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  final AppwriteAuthService _appwriteAuthService = locator<AppwriteAuthService>();

  final ValueNotifier<User?> _currentUser = ValueNotifier(null);
  ValueListenable<User?> get currentUser => _currentUser;

  StreamSubscription? _authSubscription;

  bool get isLoggedIn => _currentUser.value != null;

  void initialize() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authSubscription = _appwriteAuthService.authStatus.listen((user) {
      _currentUser.value = user;
    });
  }

  Future<void> loginWithCredentials(String email, String password) async {
    email = email.trim();
    password = password.trim();

    if (email.isEmpty) {
      setError('Vul je email in');
      return;
    }

    if (password.isEmpty) {
      setError('Vul je wachtwoord in');
      return;
    }

    if (!email.contains('@')) {
      setError('Ongeldig emailadres');
      return;
    }

    await login(email, password);
  }

  Future<void> login(String email, String password) async {
    setBusy(true);
    clearError();

    try {
      await _appwriteAuthService.login(email, password);
    } catch (e) {
      setError('Login mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }


  Future<void> logout() async {
    setBusy(true);

    try {
      await _appwriteAuthService.logout();
    } catch (e) {
      setError('Logout mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel(); // ← Opruimen!
    super.dispose();
  }
}
