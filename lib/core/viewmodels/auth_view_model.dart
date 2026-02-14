import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  final AppwriteAuthService _appwriteAuthService = locator<AppwriteAuthService>();

  final ValueNotifier<User?> currentUser = ValueNotifier(null);

  StreamSubscription? _authSubscription;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isLoggedIn => currentUser.value != null;

  AuthViewModel() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authSubscription = _appwriteAuthService.authStatus.listen((user) {
      currentUser.value = user;
    });
  }

  Future<void> loginWithCredentials() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

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

    await _appwriteAuthService.login(email, password);
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

  Future<void> createAccount() async {
    if (emailController.text.isEmpty) {
      setError('Vul je email in');
      return;
    }

    if (passwordController.text.isEmpty) {
      setError('Vul je wachtwoord in');
      return;
    }

    if (!emailController.text.contains('@')) {
      setError('Ongeldig emailadres');
      return;
    }

    setBusy(true);
    clearError();

    try {
      await _appwriteAuthService.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      setError('Account creation failed: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    currentUser.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
