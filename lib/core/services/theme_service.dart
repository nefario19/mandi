import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mandi/core/utils/logger.dart';

class ThemeService {
  static const String _languageKey = 'app_language';
  static const String _themeModeKey = 'theme_mode';

  // ✅ PRIVATE notifiers (encapsulation!)
  final ValueNotifier<Locale> _locale;
  final ValueNotifier<ThemeMode> _themeMode;

  // ✅ PUBLIC listeners (read-only access)
  ValueListenable<Locale> get locale => _locale;
  ValueListenable<ThemeMode> get themeMode => _themeMode;

  String get currentLanguage => _locale.value.languageCode;
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  ThemeService()
      : _locale = ValueNotifier(const Locale('nl')),
        _themeMode = ValueNotifier(ThemeMode.light) {
    Logger.init(runtimeType.toString());
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load language
      final savedLanguage = prefs.getString(_languageKey);
      if (savedLanguage != null) {
        _locale.value = Locale(savedLanguage);
        Logger.info(runtimeType.toString(), 'Loaded language: $savedLanguage');
      }

      // Load theme mode
      final savedThemeIndex = prefs.getInt(_themeModeKey);
      if (savedThemeIndex != null) {
        _themeMode.value = ThemeMode.values[savedThemeIndex];
      }
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to load preferences: $e');
    }
  }

  // Change language
  Future<void> setLanguage(String languageCode) async {
    try {
      _locale.value = Locale(languageCode);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);

      Logger.info(runtimeType.toString(), 'Language changed to: $languageCode');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to save language: $e');
    }
  }

  // Change theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      _themeMode.value = mode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeModeKey, mode.index);

      Logger.info(runtimeType.toString(), 'Theme mode changed to: $mode');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to save theme mode: $e');
    }
  }

  Future<void> toggleTheme() async {
    final current = themeMode.value;
    final next = current == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }

  void dispose() {
    _locale.dispose();
    _themeMode.dispose();
    Logger.disposed(runtimeType.toString());
  }
}
