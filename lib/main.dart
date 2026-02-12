import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/router/app_router.dart';
import 'package:mandi/core/services/app_info_service.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/ui/common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<AppInfoService>().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return ListenableBuilder(
      listenable: Listenable.merge([
        themeService.locale,
        themeService.themeMode,
      ]),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Mandi',
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: themeService.themeMode.value,
          locale: themeService.locale.value,
          routerConfig: _appRouter.router,
        );
      },
    );
  }
}
