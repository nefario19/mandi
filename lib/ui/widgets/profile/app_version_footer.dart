import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/app_info_service.dart';

class AppVersionFooter extends StatelessWidget {
  const AppVersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appInfo = locator<AppInfoService>();

    return Column(
      children: [
        Text(
          'Mandi ${appInfo.versionString}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(4),
        Text(
          '© 2026 Mandi Church',
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
