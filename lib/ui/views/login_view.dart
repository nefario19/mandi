import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/i18n/strings.g.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../widgets/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final viewModel = locator<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(t.auth.login))),
      body: LoginContent(viewModel: viewModel),
    );
  }
}
