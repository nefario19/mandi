import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';

class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool showChevron;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final bool isDanger;
  final String? subtitle;

  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.showChevron = true,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.isDanger = false,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Environment.size12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Environment.size16,
          vertical: Environment.size16,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(Environment.size12),
          border: Border.all(
            color: isDanger
                ? Color(0xFFef4444).withValues(alpha: 0.3)
                : theme.dividerColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? theme.colorScheme.primary,
              size: Environment.size24,
            ),
            const SizedBox(width: Environment.size16),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.titleMedium,
              ),
            ),
            if (showChevron)
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: Environment.size16,
              ),
          ],
        ),
      ),
    );
  }

  factory ProfileActionButton.withRadioButtonCheck(
    final IconData icon,
    final String label,
    final VoidCallback onTap,
    final bool showChevron,
    final Color? backgroundColor,
    final Color? textColor,
    final Color? iconColor,
    final bool isDanger,
    final String? subtitle,
  ) {
    return ProfileActionButton(icon: icon, label: label, onTap: onTap, showChevron: false,);
  }
}
