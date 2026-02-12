import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/constants/environment.dart';

class UserInfoCard extends StatelessWidget {
  final User user;

  const UserInfoCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(Environment.size24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Environment.size16),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.3),
          width: 1,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.5),
        //     blurRadius: 10,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: Environment.size40,
            backgroundColor: theme.colorScheme.secondary.withValues(alpha: 0.2),
            child: Icon(
              Icons.person,
              size: Environment.size40,
              color: theme.colorScheme.secondary,
            ),
          ),
          Gap(Environment.size16),
          Text(
            user.name,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Gap(Environment.size4),
          Text(
            'User since 2024',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          Gap(Environment.size16),
          Container(
            height: 1,
            width: 100,
            color: Colors.grey.shade300,
          ),
          Gap(Environment.size16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                size: Environment.size16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                '3 reserveringen deze maand',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
