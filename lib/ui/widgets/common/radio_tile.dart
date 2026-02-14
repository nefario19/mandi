import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/ui/widgets/common/base_action_card.dart';

class RadioTile<T> extends StatelessWidget {
  final IconData? icon; // ← Optioneel!
  final Widget? leading; //
  final Color? iconColor;
  final String title;
  final Color? textColor;
  final String? subtitle;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final bool showIconContainer;
  final Color? backgroundColor;

  const RadioTile({
    super.key,
    this.icon,
    this.leading,
    this.iconColor,
    required this.title,
    this.textColor,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.showIconContainer = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = value == groupValue;

    final effectiveIconColor = iconColor ?? theme.iconTheme.color;
    final effectiveTextColor = textColor ?? theme.textTheme.titleMedium?.color;

    return BaseActionCard(
      onTap: () {
        onChanged(value);
      },
      isSelected: isSelected,
      backgroundColor: backgroundColor,
      child: Row(
        children: [
          if (leading != null)
            leading!
          else if (icon != null)
            _buildIcon(icon!, effectiveIconColor, theme)
          else
            const SizedBox.shrink(),

          if (icon != null || leading != null) const Gap(Environment.size16),

          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: effectiveTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const Gap(4),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected
                ? theme.colorScheme.secondary
                : theme.iconTheme.color?.withValues(alpha: 0.3),
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData, Color? color, ThemeData theme) {
    if (showIconContainer) {
      return Icon(
        iconData,
        color: color ?? theme.iconTheme.color,
        size: Environment.size24,
      );
    }
    return Icon(
      iconData,
      color: color ?? theme.iconTheme.color,
      size: Environment.size24,
    );
  }
}
