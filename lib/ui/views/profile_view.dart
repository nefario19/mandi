import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:mandi/ui/widgets/common/action_tile.dart';
import 'package:mandi/ui/widgets/common/mandi_divider.dart';
import 'package:mandi/ui/widgets/profile/user_info_card.dart';
import 'package:mandi/ui/widgets/profile/app_version_footer.dart';

import 'package:mandi/i18n/strings.g.dart'; // ← Import!

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context); // ← Get translations!

    return ViewModelBuilder<ProfileViewModel>(
      builder: (context, viewModel) {
        return Scaffold(
          body: ValueListenableBuilder(
            valueListenable: viewModel.currentUserNotifier,
            builder: (context, user, child) {
              if (user == null) {
                return Center(
                  child: Text(t.auth.notLoggedIn), // ✅ Type-safe!
                );
              }

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: Environment.size16),
                child: Column(
                  children: [
                    // UserInfoCard
                    UserInfoCard(user: user),
                    const Gap(20),
                    MandiDivider(
                      shape: BoxShape.circle,
                    ),
                    const Gap(20),

                    // Settings
                    ActionTile(
                      icon: Icons.settings_outlined,
                      label: t.profile.settings, // ✅ Translated!
                      onTap: () => context.push('/settings'),
                    ),
                    const Gap(12),

                    // Reservations
                    ActionTile(
                      icon: Icons.calendar_today_outlined,
                      label: t.profile.myReservations, // ✅ Translated!
                      onTap: () => context.push('/reservationsView'),
                    ),
                    const Gap(20),

                    // Logout
                    ActionTile(
                      icon: Icons.logout,
                      label: t.profile.logout, // ✅ Translated!
                      onTap: () => _showLogoutDialog(context, viewModel),
                      isDanger: true,
                      showChevron: false,
                      centerContent: true,
                    ),
                    const Gap(32),

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
    final t = Translations.of(context); // ← Get translations!

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
            Text(t.profile.logoutDialog.title), // ✅ "Uitloggen" / "Logout"
          ],
        ),
        content: Text(t.profile.logoutDialog.message), // ✅ Translated!
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              t.profile.logoutDialog.cancel, // ✅ "Annuleren" / "Cancel"
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text(t.profile.logoutDialog.confirm), // ✅ "Uitloggen" / "Logout"
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await viewModel.logout();
    }
  }
}
