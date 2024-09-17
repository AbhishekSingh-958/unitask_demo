import 'package:shared_preferences/shared_preferences.dart';

class PreferenceKey {
  static const String name = 'name';
  static const String email = 'email';
  static const String userId = 'id';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  // static const String countryCode = 'countryCode';
  static const String login = 'isLogin';
}

class PreferencesManager {
  static final PreferencesManager _instance = PreferencesManager._internal();
  late SharedPreferences _prefs;

  factory PreferencesManager() {
    return _instance;
  }

  PreferencesManager._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<void> clearAll() async {
    _prefs.clear();
  }
}
