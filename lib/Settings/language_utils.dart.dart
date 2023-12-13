// language_utils.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LanguageUtils {
  static Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
  }

  static Locale getCurrentLocale() {
    return Intl.getCurrentLocale() == 'fr_FR' ? const Locale('fr', 'FR') : const Locale('en', 'US');
  }

  static Future<void> changeLanguage(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String currentLanguage = prefs.getString('selectedLanguage') ?? 'en';

    final newLanguage = currentLanguage == 'en' ? 'fr' : 'en';

    await setLanguage(newLanguage);

    // Set the new locale for the app
    final Locale newLocale = getCurrentLocale();
    Intl.defaultLocale = newLocale.toString();

    // Rebuild the app with the new locale
    (context as Element).markNeedsBuild();
  }
}
