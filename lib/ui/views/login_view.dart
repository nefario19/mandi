import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../widgets/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<AuthViewModel>();

    return Scaffold(
      body: LoginContent(viewModel: viewModel),
    );
  }
}
