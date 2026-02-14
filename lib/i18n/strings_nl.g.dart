///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsNl with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppNl app = _TranslationsAppNl._(_root);
	@override late final _TranslationsNavigationNl navigation = _TranslationsNavigationNl._(_root);
	@override late final _TranslationsHomeNl home = _TranslationsHomeNl._(_root);
	@override late final _TranslationsCommonNl common = _TranslationsCommonNl._(_root);
	@override late final _TranslationsProfileNl profile = _TranslationsProfileNl._(_root);
	@override late final _TranslationsSettingsNl settings = _TranslationsSettingsNl._(_root);
	@override late final _TranslationsAuthNl auth = _TranslationsAuthNl._(_root);
}

// Path: app
class _TranslationsAppNl implements TranslationsAppEn {
	_TranslationsAppNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mandi';
}

// Path: navigation
class _TranslationsNavigationNl implements TranslationsNavigationEn {
	_TranslationsNavigationNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get news => 'Nieuws';
	@override String get profile => 'Profiel';
}

// Path: home
class _TranslationsHomeNl implements TranslationsHomeEn {
	_TranslationsHomeNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Welkom';
}

// Path: common
class _TranslationsCommonNl implements TranslationsCommonEn {
	_TranslationsCommonNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get logout => 'Uitloggen';
	@override String get cancel => 'Annuleren';
	@override String get confirm => 'Bevestigen';
	@override String get save => 'Opslaan';
	@override String get delete => 'Verwijderen';
}

// Path: profile
class _TranslationsProfileNl implements TranslationsProfileEn {
	_TranslationsProfileNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profiel';
	@override String get settings => 'Instellingen';
	@override String get myReservations => 'Mijn Reserveringen';
	@override String memberSince({required Object year}) => 'Lid sinds ${year}';
	@override String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'Mijn reserveringen deze maand ${reservationsThisMonth}';
	@override String get logout => 'Uitloggen';
	@override late final _TranslationsProfileLogoutDialogNl logoutDialog = _TranslationsProfileLogoutDialogNl._(_root);
}

// Path: settings
class _TranslationsSettingsNl implements TranslationsSettingsEn {
	_TranslationsSettingsNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instellingen';
	@override late final _TranslationsSettingsLanguageNl language = _TranslationsSettingsLanguageNl._(_root);
	@override late final _TranslationsSettingsThemeNl theme = _TranslationsSettingsThemeNl._(_root);
}

// Path: auth
class _TranslationsAuthNl implements TranslationsAuthEn {
	_TranslationsAuthNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get login => 'Inloggen';
	@override String get logout => 'Uitloggen';
	@override String get email => 'E-mailadres';
	@override String get password => 'Wachtwoord';
	@override String get notLoggedIn => 'Niet ingelogd';
	@override String get registerHere => 'Registreer hier';
}

// Path: profile.logoutDialog
class _TranslationsProfileLogoutDialogNl implements TranslationsProfileLogoutDialogEn {
	_TranslationsProfileLogoutDialogNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uitloggen';
	@override String get message => 'Weet je zeker dat je wilt uitloggen?';
	@override String get confirm => 'Uitloggen';
	@override String get cancel => 'Annuleren';
}

// Path: settings.language
class _TranslationsSettingsLanguageNl implements TranslationsSettingsLanguageEn {
	_TranslationsSettingsLanguageNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taal';
	@override String get dutch => 'Nederlands';
	@override String get english => 'English';
	@override String get arabic => 'العربية';
}

// Path: settings.theme
class _TranslationsSettingsThemeNl implements TranslationsSettingsThemeEn {
	_TranslationsSettingsThemeNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Weergave';
	@override String get light => 'Licht';
	@override String get lightDesc => 'Altijd lichte modus';
	@override String get system => 'Systeem';
	@override String get systemDesc => 'Volg iPhone/iPad instelling';
	@override String get dark => 'Donker';
	@override String get darkDesc => 'Altijd donkere modus';
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Mandi',
			'navigation.news' => 'Nieuws',
			'navigation.profile' => 'Profiel',
			'home.welcome' => 'Welkom',
			'common.logout' => 'Uitloggen',
			'common.cancel' => 'Annuleren',
			'common.confirm' => 'Bevestigen',
			'common.save' => 'Opslaan',
			'common.delete' => 'Verwijderen',
			'profile.title' => 'Profiel',
			'profile.settings' => 'Instellingen',
			'profile.myReservations' => 'Mijn Reserveringen',
			'profile.memberSince' => ({required Object year}) => 'Lid sinds ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'Mijn reserveringen deze maand ${reservationsThisMonth}',
			'profile.logout' => 'Uitloggen',
			'profile.logoutDialog.title' => 'Uitloggen',
			'profile.logoutDialog.message' => 'Weet je zeker dat je wilt uitloggen?',
			'profile.logoutDialog.confirm' => 'Uitloggen',
			'profile.logoutDialog.cancel' => 'Annuleren',
			'settings.title' => 'Instellingen',
			'settings.language.title' => 'Taal',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'Weergave',
			'settings.theme.light' => 'Licht',
			'settings.theme.lightDesc' => 'Altijd lichte modus',
			'settings.theme.system' => 'Systeem',
			'settings.theme.systemDesc' => 'Volg iPhone/iPad instelling',
			'settings.theme.dark' => 'Donker',
			'settings.theme.darkDesc' => 'Altijd donkere modus',
			'auth.login' => 'Inloggen',
			'auth.logout' => 'Uitloggen',
			'auth.email' => 'E-mailadres',
			'auth.password' => 'Wachtwoord',
			'auth.notLoggedIn' => 'Niet ingelogd',
			'auth.registerHere' => 'Registreer hier',
			_ => null,
		};
	}
}
