import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';

class BaseActionCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isDanger;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const BaseActionCard({
    super.key,
    required this.child,
    this.onTap,
    this.isSelected = false,
    this.isDanger = false,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        borderRadius: BorderRadius.circular(Environment.size12),
        border: Border.all(
          color: _getBorderColor(theme),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Environment.size12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(Environment.size16),
          child: child,
        ),
      ),
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (backgroundColor != null) {
      return backgroundColor!;
    }
    if (isDanger) {
      return const Color(0xFFef4444).withValues(alpha: 0.05); 
    }
    return theme.colorScheme.surface;
  }

  Color _getBorderColor(ThemeData theme) {
    if (isDanger) {
      return const Color(0xFFef4444).withValues(alpha: 0.3);
    }
    if (isSelected) {
      return theme.colorScheme.secondary;
    }
    return theme.dividerColor.withValues(alpha: 0.3);
  }
}
