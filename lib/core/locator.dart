import 'package:get_it/get_it.dart';
import 'package:mandi/core/services/app_info_service.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/services/realtime_service.dart';
import 'package:mandi/core/services/shared_preferences_service.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/core/viewmodels/home_view_model.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton(AppInfoService());
  locator.registerSingleton(SharedPreferencesService());
  locator.registerSingleton(ClientService());
  locator.registerSingleton(RealtimeService());
  locator.registerSingleton(AppwriteAuthService());
  locator.registerLazySingleton(() => ThemeService());

  // ViewModels
  locator.registerSingleton(AuthViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerFactory(() => ProfileViewModel());
}
