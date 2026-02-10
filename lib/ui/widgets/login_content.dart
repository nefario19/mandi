import 'package:flutter/material.dart';
import '../../core/viewmodels/auth_view_model.dart';

class LoginContent extends StatefulWidget {
  final AuthViewModel viewModel;

  const LoginContent({
    super.key,
    required this.viewModel,
  });

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Wachtwoord',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ValueListenableBuilder<bool>(
            valueListenable: widget.viewModel.isBusy,
            builder: (context, isBusy, child) {
              return ElevatedButton(
                onPressed: isBusy ? null : _handleLogin,
                child: isBusy
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text('Inloggen'),
              );
            },
          ),
          SizedBox(height: 16),
          ValueListenableBuilder<String?>(
            valueListenable: widget.viewModel.errorMessage,
            builder: (context, error, child) {
              if (error == null) return SizedBox.shrink();
              return Text(
                error,
                style: TextStyle(color: Colors.red),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    widget.viewModel.login(
      _emailController.text,
      _passwordController.text,
    );
  }
}
