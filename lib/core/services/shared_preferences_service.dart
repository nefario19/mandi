import 'package:mandi/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  Future<void> initialize() async {
    Logger.init(runtimeType.toString());
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key, {String? defaultValue}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  int? getInt(String key, {int? defaultValue}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  bool? getBool(String key, {bool? defaultValue}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }
}
