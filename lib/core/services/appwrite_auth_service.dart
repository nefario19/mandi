import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/utils/logger.dart';

class AppwriteAuthService {
  late final Client _client;
  late final Account _account;

  User? _currentUser;
  User? get currentUser => _currentUser;

  final _authController = StreamController<User?>.broadcast();

  Stream<User?> get authStatus => _authController.stream;

  bool get isLoggedIn => _currentUser != null;
  String? get userEmail => _currentUser?.email;
  String? get userId => _currentUser?.id;

  AppwriteAuthService() {
    Logger.init('AppwriteAuthService');
    _client = locator<ClientService>().client;
    _account = locator<ClientService>().account;
    _checkCurrentSession();
    _client.ping();
  }

  Future<void> _checkCurrentSession() async {
    try {
      final appwriteUser = await _account.get();
      final user = User.fromAppwriteUser(appwriteUser);
      _currentUser = user;
      _authController.add(user);
      Logger.info('AppwriteAuthService', 'Session found');
    } catch (e) {
      _currentUser = null;
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

      final appwriteUser = await _account.get();
      final user = User.fromAppwriteUser(appwriteUser);
      _currentUser = user;
      _authController.add(user);
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
      _currentUser = null;
      _authController.add(null);
      Logger.success('AppwriteAuthService', 'LOGOUT success');
    } catch (e) {
      Logger.error('AppwriteAuthService', 'LOGOUT failed: $e');
      rethrow;
    }
  }

  Future<void> register({required String email, required String password}) async {
    Logger.log(runtimeType.toString(), 'Registration started');

    try {
      await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      Logger.log(runtimeType.toString(), 'Account created, logging in...');

      await login(email, password);
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Registration failed: $e');
      rethrow;
    }
  }

  void dispose() {
    Logger.disposed('AppwriteAuthService');
    _authController.close();
  }
}
