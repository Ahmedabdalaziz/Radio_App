// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get navigationBarTitleMain {
    return Intl.message(
      'Home',
      name: 'navigationBarTitleMain',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navigationBarTitleSettings {
    return Intl.message(
      'Settings',
      name: 'navigationBarTitleSettings',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get navigationBarTitleFavorites {
    return Intl.message(
      'Favorites',
      name: 'navigationBarTitleFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Radio Stations`
  String get radioStations {
    return Intl.message(
      'Radio Stations',
      name: 'radioStations',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Font Size`
  String get font_size {
    return Intl.message('Font Size', name: 'font_size', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `There are no favorite stations yet`
  String get noFavoritesYet {
    return Intl.message(
      'There are no favorite stations yet',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `Add your favorite stations to appear here`
  String get addToFavorites {
    return Intl.message(
      'Add your favorite stations to appear here',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the app?`
  String get exitMessage {
    return Intl.message(
      'Are you sure you want to exit the app?',
      name: 'exitMessage',
      desc: '',
      args: [],
    );
  }

  /// `https://www.facebook.com/ahmed.abd.elaziz.971908`
  String get facebook {
    return Intl.message(
      'https://www.facebook.com/ahmed.abd.elaziz.971908',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `https://wa.me/+201002345678`
  String get whatsapp {
    return Intl.message(
      'https://wa.me/+201002345678',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `https://github.com/Ahmedabdalaziz`
  String get github {
    return Intl.message(
      'https://github.com/Ahmedabdalaziz',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load contact ways`
  String get failedToLoadConnection {
    return Intl.message(
      'Failed to load contact ways',
      name: 'failedToLoadConnection',
      desc: '',
      args: [],
    );
  }

  /// `Follow us on`
  String get followUs {
    return Intl.message('Follow us on', name: 'followUs', desc: '', args: []);
  }

  /// `Choose`
  String get choose {
    return Intl.message('Choose', name: 'choose', desc: '', args: []);
  }

  /// `Country selected`
  String get selectedCountry {
    return Intl.message(
      'Country selected',
      name: 'selectedCountry',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load stations`
  String get failedToLoadStation {
    return Intl.message(
      'Failed to load stations',
      name: 'failedToLoadStation',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
