import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/widgets/common/radio_tile.dart';
import 'package:mandi/ui/widgets/common/section_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.settings.title),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: Listenable.merge([
          themeService.locale,
          themeService.themeMode,
        ]),
        builder: (context, child) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SectionHeader(
                icon: Icons.language,
                title: t.settings.language.title,
                theme: theme,
              ),
              const Gap(16),
              RadioTile<String>(
                leading: const Text('🇳🇱', style: TextStyle(fontSize: 24)),
                title: t.settings.language.dutch,
                value: 'nl',
                groupValue: themeService.currentLanguage,
                onChanged: (lang) => themeService.setLanguage(lang),
                showIconContainer: false,
              ),
              const Gap(12),
              RadioTile<String>(
                leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
                title: t.settings.language.english,
                value: 'en',
                groupValue: themeService.currentLanguage,
                onChanged: (lang) => themeService.setLanguage(lang),
                showIconContainer: false,
              ),
              const Gap(12),
              RadioTile<String>(
                leading: const Text('🇸🇦', style: TextStyle(fontSize: 24)),
                title: t.settings.language.arabic,
                value: 'ar',
                groupValue: themeService.currentLanguage,
                onChanged: (lang) => themeService.setLanguage(lang),
                showIconContainer: false,
              ),
              const Gap(32),
              SectionHeader(
                title: t.settings.theme.title,
                theme: theme,
              ),
              const Gap(16),
              RadioTile<ThemeMode>(
                icon: Icons.light_mode_outlined,
                title: t.settings.theme.light,
                subtitle: t.settings.theme.lightDesc,
                value: ThemeMode.light,
                groupValue: themeService.themeMode.value,
                onChanged: (mode) => themeService.setThemeMode(mode),
              ),
              const Gap(12),
              RadioTile<ThemeMode>(
                icon: Icons.brightness_auto_outlined,
                title: t.settings.theme.system,
                subtitle: t.settings.theme.systemDesc,
                value: ThemeMode.system,
                groupValue: themeService.themeMode.value,
                onChanged: (mode) => themeService.setThemeMode(mode),
              ),
              const Gap(12),
              RadioTile<ThemeMode>(
                icon: Icons.dark_mode_outlined,
                title: t.settings.theme.dark,
                subtitle: t.settings.theme.darkDesc,
                value: ThemeMode.dark,
                groupValue: themeService.themeMode.value,
                onChanged: (mode) => themeService.setThemeMode(mode),
              ),
            ],
          );
        },
      ),
    );
  }
}
