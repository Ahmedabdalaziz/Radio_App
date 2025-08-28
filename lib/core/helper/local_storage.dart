import 'package:shared_preferences/shared_preferences.dart';

class LocalizationStorage {
  static const String languageCodeKey = 'language_code';

  static Future<void> saveLanguageCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageCodeKey, code);
  }

  static Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageCodeKey);
  }
}

class CountryStorage {
  static const String countryCodeKey = 'country';

  static Future<void> saveCountryCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(countryCodeKey, code);
  }

  static Future<String?> getCountryCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(countryCodeKey);
  }
}
