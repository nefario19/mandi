import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<HomeViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Welkom!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Text(
                  viewModel.currentUser?.email ?? 'Geen gebruiker',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
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
  }
}
