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
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppAr app = _TranslationsAppAr._(_root);
	@override late final _TranslationsNavigationAr navigation = _TranslationsNavigationAr._(_root);
	@override late final _TranslationsHomeAr home = _TranslationsHomeAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsProfileAr profile = _TranslationsProfileAr._(_root);
	@override late final _TranslationsSettingsAr settings = _TranslationsSettingsAr._(_root);
	@override late final _TranslationsAuthAr auth = _TranslationsAuthAr._(_root);
}

// Path: app
class _TranslationsAppAr implements TranslationsAppEn {
	_TranslationsAppAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get name => 'ماندي';
}

// Path: navigation
class _TranslationsNavigationAr implements TranslationsNavigationEn {
	_TranslationsNavigationAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get news => 'الأخبار';
	@override String get profile => 'الملف الشخصي';
}

// Path: home
class _TranslationsHomeAr implements TranslationsHomeEn {
	_TranslationsHomeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'أهلاً وسهلاً';
}

// Path: common
class _TranslationsCommonAr implements TranslationsCommonEn {
	_TranslationsCommonAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get logout => 'تسجيل الخروج';
	@override String get cancel => 'إلغاء';
	@override String get confirm => 'تأكيد';
	@override String get save => 'حفظ';
	@override String get delete => 'حذف';
}

// Path: profile
class _TranslationsProfileAr implements TranslationsProfileEn {
	_TranslationsProfileAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override String get settings => 'الإعدادات';
	@override String get myReservations => 'حجوزاتي';
	@override String memberSince({required Object year}) => 'عضو منذ ${year}';
	@override String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'حجوزاتي هذا الشهر ${reservationsThisMonth}';
	@override String get logout => 'تسجيل الخروج';
	@override late final _TranslationsProfileLogoutDialogAr logoutDialog = _TranslationsProfileLogoutDialogAr._(_root);
}

// Path: settings
class _TranslationsSettingsAr implements TranslationsSettingsEn {
	_TranslationsSettingsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override late final _TranslationsSettingsLanguageAr language = _TranslationsSettingsLanguageAr._(_root);
	@override late final _TranslationsSettingsThemeAr theme = _TranslationsSettingsThemeAr._(_root);
}

// Path: auth
class _TranslationsAuthAr implements TranslationsAuthEn {
	_TranslationsAuthAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'تسجيل الدخول';
	@override String get logout => 'تسجيل الخروج';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get notLoggedIn => 'غير مسجل الدخول';
	@override String get registerHere => 'سجِّل هنا';
}

// Path: profile.logoutDialog
class _TranslationsProfileLogoutDialogAr implements TranslationsProfileLogoutDialogEn {
	_TranslationsProfileLogoutDialogAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الخروج';
	@override String get message => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';
	@override String get confirm => 'تسجيل الخروج';
	@override String get cancel => 'إلغاء';
}

// Path: settings.language
class _TranslationsSettingsLanguageAr implements TranslationsSettingsLanguageEn {
	_TranslationsSettingsLanguageAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اللغة';
	@override String get dutch => 'Nederlands';
	@override String get english => 'English';
	@override String get arabic => 'العربية';
}

// Path: settings.theme
class _TranslationsSettingsThemeAr implements TranslationsSettingsThemeEn {
	_TranslationsSettingsThemeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'العرض';
	@override String get light => 'فاتح';
	@override String get lightDesc => 'الوضع الفاتح دائماً';
	@override String get system => 'النظام';
	@override String get systemDesc => 'اتبع إعداد الجهاز';
	@override String get dark => 'داكن';
	@override String get darkDesc => 'الوضع الداكن دائماً';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'ماندي',
			'navigation.news' => 'الأخبار',
			'navigation.profile' => 'الملف الشخصي',
			'home.welcome' => 'أهلاً وسهلاً',
			'common.logout' => 'تسجيل الخروج',
			'common.cancel' => 'إلغاء',
			'common.confirm' => 'تأكيد',
			'common.save' => 'حفظ',
			'common.delete' => 'حذف',
			'profile.title' => 'الملف الشخصي',
			'profile.settings' => 'الإعدادات',
			'profile.myReservations' => 'حجوزاتي',
			'profile.memberSince' => ({required Object year}) => 'عضو منذ ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'حجوزاتي هذا الشهر ${reservationsThisMonth}',
			'profile.logout' => 'تسجيل الخروج',
			'profile.logoutDialog.title' => 'تسجيل الخروج',
			'profile.logoutDialog.message' => 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
			'profile.logoutDialog.confirm' => 'تسجيل الخروج',
			'profile.logoutDialog.cancel' => 'إلغاء',
			'settings.title' => 'الإعدادات',
			'settings.language.title' => 'اللغة',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'العرض',
			'settings.theme.light' => 'فاتح',
			'settings.theme.lightDesc' => 'الوضع الفاتح دائماً',
			'settings.theme.system' => 'النظام',
			'settings.theme.systemDesc' => 'اتبع إعداد الجهاز',
			'settings.theme.dark' => 'داكن',
			'settings.theme.darkDesc' => 'الوضع الداكن دائماً',
			'auth.login' => 'تسجيل الدخول',
			'auth.logout' => 'تسجيل الخروج',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.notLoggedIn' => 'غير مسجل الدخول',
			'auth.registerHere' => 'سجِّل هنا',
			_ => null,
		};
	}
}
