import 'package:flutter/material.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import '../../core/viewmodels/auth_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>(
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Mandi'),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () => viewModel.logout(),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: viewModel.currentUser,
                  builder: (context, user, child) {
                    return Column(
                      children: [
                        Text(
                          'Welkom!',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 8),
                        Text(
                          user?.email ?? 'Geen gebruiker',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isBusy,
                  builder: (context, isBusy, child) {
                    return ElevatedButton(
                      onPressed: isBusy ? null : () => viewModel.logout(),
                      child: isBusy
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text('Uitloggen'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
