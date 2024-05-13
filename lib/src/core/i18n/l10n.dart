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

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Let's continue where we left off.`
  String get login_subtitle {
    return Intl.message(
      'Let\'s continue where we left off.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_emailLabel {
    return Intl.message(
      'Email',
      name: 'login_emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ex: KpNqg@example.com`
  String get login_emailHint {
    return Intl.message(
      'Ex: KpNqg@example.com',
      name: 'login_emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_passwordLabel {
    return Intl.message(
      'Password',
      name: 'login_passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `************`
  String get login_passwordHint {
    return Intl.message(
      '************',
      name: 'login_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get login_forgotPasswordLabel {
    return Intl.message(
      'Forgot password?',
      name: 'login_forgotPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get login_googleBtnLabel {
    return Intl.message(
      'Sign in with Google',
      name: 'login_googleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get login_appleBtnLabel {
    return Intl.message(
      'Sign in with Apple',
      name: 'login_appleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_submitBtnLabel {
    return Intl.message(
      'Login',
      name: 'login_submitBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get loadingDialog_content {
    return Intl.message(
      'Please wait...',
      name: 'loadingDialog_content',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
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
