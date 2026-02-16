import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/auth_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();

  ValueListenable<User?> get currentUser => _userService.currentUser;

  bool get isLoggedIn => _authService.isLoggedIn;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  AuthViewModel();

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

    setBusy(true);
    clearError();

    try {
      await _authService.login(email, password);
    } catch (e) {
      setError('Login mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  Future<void> logout() async {
    setBusy(true);
    clearError();

    try {
      await _authService.logout();
    } catch (e) {
      setError('Logout mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  Future<void> createAccount() async {
    if (emailController.text.isEmpty) {
      setError('Enter your name');
      return;
    }

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
      await _authService.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: nameController.text.trim(),
      );
    } catch (e) {
      setError('Account creation failed: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
