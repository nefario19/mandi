import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';

class RegistrationContent extends StatelessWidget {
  final AuthViewModel viewModel;

  const RegistrationContent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: viewModel.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextField(
            controller: viewModel.passwordController,
            decoration: InputDecoration(
              labelText: 'Wachtwoord',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.isBusy,
            builder: (context, isBusy, child) {
              return ElevatedButton(
                onPressed: isBusy ? null : viewModel.createAccount,
                child: isBusy
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text('Register'),
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
            child: Text('Login here'),
          )
        ],
      ),
    );
  }
}
