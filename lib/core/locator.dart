import 'package:get_it/get_it.dart';
import 'package:mandi/core/services/appwrite_auth_service.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/core/viewmodels/home_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton<ClientService>(ClientService());
  locator.registerSingleton<AppwriteAuthService>(AppwriteAuthService());

  locator.registerSingleton(AuthViewModel());
  locator.registerSingleton(HomeViewModel());
}

