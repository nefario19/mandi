import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../widgets/login_content.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = locator<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: LoginContent(viewModel: viewModel),
    );
  }
}
