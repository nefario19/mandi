import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/widgets/common/mandi_divider.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  final ProfileViewModel viewModel;

  const UserInfoCard({
    super.key,
    required this.user,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return Container(
        padding: const EdgeInsets.all(Environment.size24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(Environment.size16),
          border: Border.all(
            color: theme.dividerColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: viewModel.currentUser,
                    builder: (context, user, _) {
                      return Stack(
                        children: [
                          CircleAvatar(
                            radius: Environment.size40,
                            backgroundColor: user?.avatarUrl == null
                                ? theme.colorScheme.secondary.withValues(alpha: 0.2)
                                : null,
                            backgroundImage:
                                user?.avatarUrl != null ? NetworkImage(user!.avatarUrl!) : null,
                            child: user?.avatarUrl == null
                                ? Icon(
                                    Icons.person,
                                    size: Environment.size40,
                                    color: theme.colorScheme.secondary,
                                  )
                                : null,
                          ),

                          // ✅ Camera icon overlay (bottom-right)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: Environment.size16,
                              backgroundColor: theme.colorScheme.primary,
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: Environment.size16,
                                ),
                                onPressed: () => viewModel.updateAvatar(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                Gap(Environment.size16),
                Column(
                  children: [
                    Text(
                      user.fullName,
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Gap(Environment.size4),
                    Text(
                      t.profile.memberSince(year: 2006),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Gap(Environment.size16),
              ],
            ),
            Gap(Environment.size16),
            MandiDivider(),
            Gap(Environment.size16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.email,
                  size: Environment.size16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  user.email,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            Gap(Environment.size12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: Environment.size16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  t.profile.myReservationsNrThisMonth(reservationsThisMonth: 3),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ));
  }
}
