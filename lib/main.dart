import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mandi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter.router,
    );
  }
}
