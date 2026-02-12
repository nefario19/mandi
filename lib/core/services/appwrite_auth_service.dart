import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/constants/realtime_channels.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/realtime_service.dart';
import 'package:mandi/core/utils/logger.dart';

class AppwriteAuthService {
  late final Client _client;
  late final Account _account;
  late final RealtimeService _realtimeService;

  User? _currentUser;
  User? get currentUser => _currentUser;

  final _authController = StreamController<User?>.broadcast();

  Stream<User?> get authStatus => _authController.stream;
  StreamSubscription<RealtimeMessage>? _accountEventsSubscription;

  bool get isLoggedIn => _currentUser != null;
  String? get userEmail => _currentUser?.email;
  String? get userId => _currentUser?.id;

  AppwriteAuthService() {
    Logger.init('AppwriteAuthService');
    _client = locator<ClientService>().client;
    _account = locator<ClientService>().account;
    _realtimeService = locator<RealtimeService>();
    _checkCurrentSession();
    _subscribeToAccountEvents();
    _client.ping();
  }

  void _subscribeToAccountEvents() {
    Logger.info(runtimeType.toString(), '📡 Subscribing to account events');

    _accountEventsSubscription = _realtimeService.subscribe(RealtimeChannels.account).listen(
      (event) {
        Logger.log(runtimeType.toString(), '📨 Realtime: ${event.events}');

        // Session deleted
        if (event.events.any((e) => e.contains('session') && e.contains('delete'))) {
          Logger.info(runtimeType.toString(), '🔴 Session deleted remotely');
          _authController.add(null);
        }

        // Account deleted
        if (event.events
            .any((e) => e.contains('account') && e.contains('delete') && !e.contains('session'))) {
          _authController.add(null);
        }

        // Account updated
        if (event.events.any((e) => e.contains('update'))) {
          _refreshSession();
        }
      },
      onError: (error) {
        Logger.log(runtimeType.toString(), '❌ Realtime error: $error');
      },
    );
  }

  Future<void> _refreshSession() async {
    try {
      Logger.info(runtimeType.toString(), '🔄 Refreshing session...');
      final account = await _account.get();
      final user = User.fromAppwriteUser(account);
      _authController.add(user);
      Logger.info(runtimeType.toString(), '✅ Session refreshed successfully');
    } catch (e) {
      Logger.log(runtimeType.toString(), '❌ Refresh failed: $e');
      _authController.add(null);
    }
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
    _accountEventsSubscription?.cancel();
    _authController.close();
  }
}
