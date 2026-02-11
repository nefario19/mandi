import 'dart:async';


import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final AppwriteAuthService _appwriteAuthService = locator<AppwriteAuthService>();

  User? get currentUser => _appwriteAuthService.currentUser;

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
}
