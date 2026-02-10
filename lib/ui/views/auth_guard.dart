import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../core/viewmodels/auth_view_model.dart';
import 'base_view.dart';
import 'login_view.dart';

class AuthGuard extends StatefulWidget {
  const AuthGuard({super.key});

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  late final AuthViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = locator<AuthViewModel>();
    _viewModel.initialize();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _viewModel.currentUser,
      builder: (context, user, child) {
        if (user != null) {
          return HomeView();
        }
        return LoginView();
      },
    );
  }
}
