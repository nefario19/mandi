import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/services/common/environment.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/utils/logger.dart';

class AppwriteAuthService {
  late final Client _client;
  late final Account _account;

  final _authController = StreamController<User?>.broadcast();

  Stream<User?> get authStatus => _authController.stream;

  AppwriteAuthService() {
    Logger.init('AppwriteAuthService');
    _setupClient();
    _checkCurrentSession();
  }

  void _setupClient() {
    _client = Client()
        .setEndpoint(Environment.appwritePublicEndpoint)
        .setProject(Environment.appwriteProjectId);

    _account = Account(_client);
  }

  Future<void> _checkCurrentSession() async {
    try {
      final user = await _account.get();
      _authController.add(User.fromAppwriteUser(user));
      Logger.info('AppwriteAuthService', 'Session found');
    } catch (e) {
      _authController.add(null);
      Logger.info('AppwriteAuthService', 'No active session');
    }
  }

  Future<void> login(String email, String password) async {
    Logger.log('AppwriteAuthService', '📧 LOGIN attempt for: $email');

    email = email.trim();
    password = password.trim();

    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      final user = await _account.get();
      _authController.add(User.fromAppwriteUser(user));
      Logger.success('AppwriteAuthService', 'LOGIN success');
    } catch (e) {
      Logger.error('AppwriteAuthService', 'LOGIN failed: $e');
      _authController.add(null);
      rethrow;
    }
  }

  Future<void> logout() async {
    Logger.log('AppwriteAuthService', '🚪 LOGOUT attempt');

    try {
      await _account.deleteSession(sessionId: 'current');
      _authController.add(null);
      Logger.success('AppwriteAuthService', 'LOGOUT success');
    } catch (e) {
      Logger.error('AppwriteAuthService', 'LOGOUT failed: $e');
      rethrow;
    }
  }

  void dispose() {
    Logger.disposed('AppwriteAuthService');
    _authController.close();
  }
}
