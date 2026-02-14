import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/i18n/strings.g.dart';
import '../../core/viewmodels/auth_view_model.dart';

class LoginContent extends StatelessWidget {
  final AuthViewModel viewModel;

  const LoginContent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: viewModel.emailController,
            decoration: InputDecoration(
              labelText: t.auth.email,
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextField(
            controller: viewModel.passwordController,
            decoration: InputDecoration(
              labelText: t.auth.password,
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.isBusy,
            builder: (context, isBusy, child) {
              return ElevatedButton(
                onPressed: isBusy ? null : viewModel.loginWithCredentials,
                child: isBusy
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(t.auth.login),
              );
            },
          ),
          SizedBox(height: 16),
          ValueListenableBuilder<String?>(
            valueListenable: viewModel.errorMessage,
            builder: (context, error, child) {
              if (error == null) return SizedBox.shrink();
              return Text(
                error,
                style: TextStyle(color: Colors.red),
              );
            },
          ),
          SizedBox(
            height: 50.0,
          ),
          TextButton(
            onPressed: () => context.go('/register'),
            child: Text(t.auth.registerHere),
          )
        ],
      ),
    );
  }
}
