import 'package:flutter/material.dart';
import 'package:mandi/ui/views/auth_guard.dart';
import 'core/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mandi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthGuard(),
    );
  }
}
