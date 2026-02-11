import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../core/viewmodels/auth_view_model.dart';
import 'home_view.dart';
import 'login_view.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = locator<AuthViewModel>();
    print('🔍 AuthGuard using: ${authViewModel.hashCode}');

    return ValueListenableBuilder(
      valueListenable: authViewModel.currentUser,
      builder: (context, user, child) {
        print('🏠 AuthGuard ValueListenableBuilder: user = ${user?.email ?? "NULL"}');
        if (user != null) {
          print('➡️ Switching to HomeView');
          return HomeView();
        }
        print('🔙 Showing LoginView');
        return LoginView();
      },
    );
  }
}
