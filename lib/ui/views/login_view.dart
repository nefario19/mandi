import 'package:flutter/material.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../widgets/login_content.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>(
      onModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: LoginContent(viewModel: viewModel), // ← Aparte widget!
        );
      },
    );
  }
}
