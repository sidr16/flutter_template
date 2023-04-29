import 'package:flutter/material.dart';

List<Locale> supportedLocales = const [
  Locale('ru'),
  Locale('en'),
];

class Language {
  static List<Locale> locales = supportedLocales;
  static Locale initialLocale = supportedLocales[0];
  static String localesPath = 'assets/lang';
}
