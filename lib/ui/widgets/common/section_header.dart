import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SectionHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final ThemeData theme;

  const SectionHeader({
    this.icon,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon!, color: theme.colorScheme.secondary, size: 20),
          const Gap(12),
        ],
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
