import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = locator<AuthViewModel>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: authViewModel.currentUser,
            builder: (context, user, child) {
              return Text(
                'Logged in as: ${user?.email ?? "Unknown"}',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: authViewModel.logout,
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
