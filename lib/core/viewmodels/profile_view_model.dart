import 'package:flutter/material.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart'; // ← ADD
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/utils/logger.dart';

class ProfileViewModel extends BaseViewModel {
  // ← CHANGE from ChangeNotifier
  final AuthViewModel _authViewModel = locator<AuthViewModel>();

  ProfileViewModel() {
    Logger.init(runtimeType.toString());
  }

  // Expose current user
  User? get currentUser => _authViewModel.currentUser.value;

  // Expose auth status stream
  ValueNotifier<User?> get currentUserNotifier => _authViewModel.currentUser;

  // Logout
  Future<void> logout() async {
    try {
      Logger.info(runtimeType.toString(), 'Logout initiated');
      await _authViewModel.logout();
      Logger.success(runtimeType.toString(), 'Logout successful');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Logout failed: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    Logger.disposed(runtimeType.toString());
    super.dispose();
  }
}
