import 'package:get_it/get_it.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register Services
  locator.registerLazySingleton<AppwriteAuthService>(() => AppwriteAuthService());

  // Register ViewModels
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
}
