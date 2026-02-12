import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/ui/widgets/profile/profile_action_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Instellingen'),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ====================
          // LANGUAGE SECTION
          // ====================
          _SectionHeader(
            icon: Icons.language,
            title: 'Taal / Language / اللغة',
            theme: theme,
          ),
          const Gap(16),

          _LanguageOption(
            flag: '🇳🇱',
            label: 'Nederlands',
            languageCode: 'nl',
            isSelected: themeService.currentLanguage == 'nl',
            onTap: () => themeService.setLanguage('nl'),
            theme: theme,
          ),
          const Gap(12),

          _LanguageOption(
            flag: '🇬🇧',
            label: 'English',
            languageCode: 'en',
            isSelected: themeService.currentLanguage == 'en',
            onTap: () => themeService.setLanguage('en'),
            theme: theme,
          ),
          const Gap(12),

          _LanguageOption(
            flag: '🇸🇦',
            label: 'العربية',
            languageCode: 'ar',
            isSelected: themeService.currentLanguage == 'ar',
            onTap: () => themeService.setLanguage('ar'),
            theme: theme,
          ),
          const Gap(32),

          // ====================
          // THEME SECTION
          // ====================
          _SectionHeader(
            title: 'Weergave',
            theme: theme,
          ),
          const Gap(16),

          _ThemeOption(
            icon: Icons.light_mode,
            title: 'Licht',
            subtitle: 'Altijd lichte modus',
            mode: ThemeMode.light,
            currentMode: themeService.themeMode.value,
            onChanged: (mode) => themeService.setThemeMode(mode),
            theme: theme,
          ),
          const Gap(12),

          _ThemeOption(
            icon: Icons.brightness_auto,
            title: 'Systeem',
            subtitle: 'Volg iPhone/iPad instelling',
            mode: ThemeMode.system,
            currentMode: themeService.themeMode.value,
            onChanged: (mode) => themeService.setThemeMode(mode),
            theme: theme,
          ),
          const Gap(12),

          _ThemeOption(
            icon: Icons.dark_mode,
            title: 'Donker',
            subtitle: 'Altijd donkere modus',
            mode: ThemeMode.dark,
            currentMode: themeService.themeMode.value,
            onChanged: (mode) => themeService.setThemeMode(mode),
            theme: theme,
          ),
        ],
      ),
    );
  }
}

// ====================
// SECTION HEADER
// ====================
class _SectionHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final ThemeData theme;

  const _SectionHeader({
    this.icon,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon!, color: theme.colorScheme.secondary),
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

// ====================
// LANGUAGE OPTION
// ====================
class _LanguageOption extends StatelessWidget {
  final String flag;
  final String label;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onTap;
  final ThemeData theme;

  const _LanguageOption({
    required this.flag,
    required this.label,
    required this.languageCode,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              isSelected ? theme.colorScheme.secondary : theme.dividerColor.withValues(alpha: 0.3),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 24)),
              const Gap(16),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.secondary,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ====================
// THEME OPTION
// ====================
class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final ThemeMode mode;
  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onChanged;
  final ThemeData theme;

  const _ThemeOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.mode,
    required this.currentMode,
    required this.onChanged,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentMode == mode;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              isSelected ? theme.colorScheme.secondary : theme.dividerColor.withValues(alpha: 0.3),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onChanged(mode),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: theme.colorScheme.secondary),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Radio<ThemeMode>(
                value: mode,
                groupValue: currentMode,
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
                activeColor: theme.colorScheme.secondary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
