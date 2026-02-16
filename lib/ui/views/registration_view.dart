import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/ui/widgets/registration_content.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<AuthViewModel>();

    return Scaffold(
      body: RegistrationContent(
        viewModel: viewModel,
      ),
    );
  }
}
