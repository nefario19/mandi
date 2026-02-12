import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:mandi/ui/widgets/profile/profile_action_button.dart';
import 'package:mandi/ui/widgets/profile/user_info_card.dart';
import 'package:mandi/ui/widgets/profile/app_version_footer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<ProfileViewModel>(
      builder: (context, viewModel) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: ValueListenableBuilder(
            valueListenable: viewModel.currentUserNotifier,
            builder: (context, user, child) {
              if (user == null) {
                return const Center(
                  child: Text('Niet ingelogd'),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ====================
                    // PROFIEL TITEL
                    // ====================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Profiel',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(24),

                    // ====================
                    // USER INFO CARD
                    // ====================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: UserInfoCard(user: user),
                    ),
                    const Gap(20),

                    // ====================
                    // INSTELLINGEN
                    // ====================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProfileActionButton(
                        icon: Icons.settings_rounded,
                        label: 'Settings',
                        onTap: () => context.push('/settings'),
                        showChevron: true,
                        iconColor: theme.iconTheme.color,
                        backgroundColor: theme.cardColor,
                      ),
                    ),
                    const Gap(12),

                    // ====================
                    // MIJN RESERVERINGEN
                    // ====================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProfileActionButton(
                        icon: Icons.calendar_today_rounded,
                        iconColor: theme.iconTheme.color,
                        label: 'My reservations',
                        onTap: () => context.push('/reservationsView'),
                      ),
                    ),
                    const Gap(20),

                    // ====================
                    // UITLOGGEN
                    // ====================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProfileActionButton(
                        icon: Icons.logout_rounded,
                        label: 'Logout',
                        onTap: () => {},
                        isDanger: true,
                        backgroundColor: Colors.red.withValues(alpha: 0.1),
                      ),
                    ),
                    const Gap(32),

                    // ====================
                    // APP VERSION
                    // ====================
                    const Center(child: AppVersionFooter()),
                    const Gap(32),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _showLogoutDialog(
    BuildContext context,
    ProfileViewModel viewModel,
  ) async {
    final theme = Theme.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.logout, color: Colors.red),
            const Gap(12),
            const Text('Uitloggen'),
          ],
        ),
        content: const Text('Weet je zeker dat je wilt uitloggen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Annuleren',
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Uitloggen'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await viewModel.logout();
    }
  }
}
