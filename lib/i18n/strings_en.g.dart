///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mandi'
	String get name => 'Mandi';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get news => 'News';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome'
	String get welcome => 'Welcome';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Delete'
	String get delete => 'Delete';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'My Reservations'
	String get myReservations => 'My Reservations';

	/// en: 'Member since $year'
	String memberSince({required Object year}) => 'Member since ${year}';

	/// en: 'My reservations this month $reservationsThisMonth'
	String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'My reservations this month ${reservationsThisMonth}';

	/// en: 'Logout'
	String get logout => 'Logout';

	late final TranslationsProfileLogoutDialogEn logoutDialog = TranslationsProfileLogoutDialogEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsLanguageEn language = TranslationsSettingsLanguageEn._(_root);
	late final TranslationsSettingsThemeEn theme = TranslationsSettingsThemeEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Email address'
	String get email => 'Email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Not logged in'
	String get notLoggedIn => 'Not logged in';

	/// en: 'Register here'
	String get registerHere => 'Register here';
}

// Path: profile.logoutDialog
class TranslationsProfileLogoutDialogEn {
	TranslationsProfileLogoutDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logout'
	String get title => 'Logout';

	/// en: 'Are you sure you want to logout?'
	String get message => 'Are you sure you want to logout?';

	/// en: 'Logout'
	String get confirm => 'Logout';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: settings.language
class TranslationsSettingsLanguageEn {
	TranslationsSettingsLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'Nederlands'
	String get dutch => 'Nederlands';

	/// en: 'English'
	String get english => 'English';

	/// en: 'العربية'
	String get arabic => 'العربية';
}

// Path: settings.theme
class TranslationsSettingsThemeEn {
	TranslationsSettingsThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Display'
	String get title => 'Display';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Always light mode'
	String get lightDesc => 'Always light mode';

	/// en: 'System'
	String get system => 'System';

	/// en: 'Follow device setting'
	String get systemDesc => 'Follow device setting';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'Always dark mode'
	String get darkDesc => 'Always dark mode';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Mandi',
			'navigation.news' => 'News',
			'navigation.profile' => 'Profile',
			'home.welcome' => 'Welcome',
			'common.logout' => 'Logout',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'profile.title' => 'Profile',
			'profile.settings' => 'Settings',
			'profile.myReservations' => 'My Reservations',
			'profile.memberSince' => ({required Object year}) => 'Member since ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'My reservations this month ${reservationsThisMonth}',
			'profile.logout' => 'Logout',
			'profile.logoutDialog.title' => 'Logout',
			'profile.logoutDialog.message' => 'Are you sure you want to logout?',
			'profile.logoutDialog.confirm' => 'Logout',
			'profile.logoutDialog.cancel' => 'Cancel',
			'settings.title' => 'Settings',
			'settings.language.title' => 'Language',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'Display',
			'settings.theme.light' => 'Light',
			'settings.theme.lightDesc' => 'Always light mode',
			'settings.theme.system' => 'System',
			'settings.theme.systemDesc' => 'Follow device setting',
			'settings.theme.dark' => 'Dark',
			'settings.theme.darkDesc' => 'Always dark mode',
			'auth.login' => 'Login',
			'auth.logout' => 'Logout',
			'auth.email' => 'Email address',
			'auth.password' => 'Password',
			'auth.notLoggedIn' => 'Not logged in',
			'auth.registerHere' => 'Register here',
			_ => null,
		};
	}
}
