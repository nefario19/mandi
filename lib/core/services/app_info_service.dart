import 'package:package_info_plus/package_info_plus.dart';
import 'package:mandi/core/utils/logger.dart';

class AppInfoService {
  late final String version;
  late final String buildNumber;
  late final String appName;
  late final String packageName;

  bool _initialized = false;
  bool get isInitialized => _initialized;

  AppInfoService() {
    Logger.init(runtimeType.toString());
  }

  Future<void> initialize() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();

      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;

      _initialized = true;

      Logger.info(runtimeType.toString(), 'App: $appName v$version ($buildNumber)');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to load app info: $e');

      version = 'Unknown';
      buildNumber = '0';
      appName = 'Mandi';
      packageName = 'com.mandi.app';

      _initialized = true;
    }
  }

  String get versionString => 'v$version ($buildNumber)';
}
