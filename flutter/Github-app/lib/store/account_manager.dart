import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AccountManager {
  static const String ARG_ACCESS_TOKEN = "arg_access_token";

  static final AccountManager _instance = new AccountManager._internal();

  AccountManager._internal();

  factory AccountManager() => _instance;

  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  Future<String> getAccessToken() {
    final userToken = _getStringValue(ARG_ACCESS_TOKEN);
    return userToken != null ? userToken : "";
  }

  setUserAccessToken(String token) => _setStringValue(ARG_ACCESS_TOKEN, token);

  // Base functions
  Future<String> _getStringValue(String prefsName) =>
      preferences.then((prefs) => prefs.getString(prefsName));

  _setStringValue(String prefsName, String value) =>
      preferences.then((prefs) => prefs.setString(prefsName, value));

  Future clear() async => (await preferences).clear();
}
