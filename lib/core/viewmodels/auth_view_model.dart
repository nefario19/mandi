import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/auth_service.dart';
import 'package:mandi/core/services/dialog_service.dart';
import 'package:mandi/core/services/error_display_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/utils/error_handler.dart';
import 'package:mandi/core/utils/logger.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final DialogService _dialogService = locator<DialogService>();
  final ErrorDisplayService _errorDisplayService = locator<ErrorDisplayService>();

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

  Future<bool> requestAccountDeletion() async {
    try {
      Logger.log(runtimeType.toString(), 'Deletion of account requested');
      final deletionConfirmed = await _dialogService.showDeleteAccountConfirmation();

      if (deletionConfirmed) {
        Logger.log(runtimeType.toString(), 'Account deletion confirmed');
        return true;
      } else {
        Logger.log(runtimeType.toString(), 'Account deletion cancelled');
        return false;
      }
    } on Exception catch (e, stackTrace) {
      Logger.error(runtimeType.toString(), 'Something went wrong with account deletion: $e');
      final error = ErrorHandler.handleException(e, stackTrace);
      _errorDisplayService.showError(error);
      return false;
    }
  }

  // In AuthViewModel
  Future<void> deleteAvatar() async {
    Logger.log(runtimeType.toString(), 'Deleting avatar...');
    await Future.delayed(Duration(seconds: 2)); // TODO: Appwrite call
    Logger.log(runtimeType.toString(), 'Avatar deleted');
  }

  Future<void> softDeleteUserData() async {
    Logger.log(runtimeType.toString(), 'Soft deleting user data...');
    await Future.delayed(Duration(seconds: 2)); // TODO: Appwrite call
    Logger.log(runtimeType.toString(), 'User data marked for deletion');
  }

  Future<void> blockAccount() async {
    Logger.log(runtimeType.toString(), 'Blocking account...');
    await Future.delayed(Duration(seconds: 2)); // TODO: Appwrite call
    await _authService.logout();
    Logger.log(runtimeType.toString(), 'Account blocked and logged out');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
