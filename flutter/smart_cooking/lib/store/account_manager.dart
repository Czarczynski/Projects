import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cooking/common/theme_changer.dart';
import 'package:smart_cooking/models/token_model.dart';
import 'package:smart_cooking/theme.dart';

class AccountManager {
  static const String ARG_ACCESS_TOKEN = "arg_access_token";

//  static const String ARG_USER_ID = "arg_user_id";
  static const String ARG_TOKEN_TYPE = "arg_token_type";

//  static const String ARG_REFRESH_TOKEN = "arg_refresh_token";
  static const String ARG_EXPIRES_AT = "arg_expires_at";

  static const String ARG_PREF_MODE = "arg_pref_mode";

  static final AccountManager _instance = AccountManager._internal();

  AccountManager._internal();

  factory AccountManager() {
    return _instance;
  }

  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  Future<String> getAccessToken() {
    final userToken = _getStringValue(ARG_ACCESS_TOKEN);
    return userToken != null ? userToken : "";
  }

//  Future<String> getUserId() {
//    final userId = _getStringValue(ARG_USER_ID);
//    return userId != null ? userId : "";
//  }

  Future<String> getExpiresAt() {
    final tokenExpiresAt = _getStringValue(ARG_EXPIRES_AT);
    return tokenExpiresAt != null ? tokenExpiresAt : "";
  }

  Future<ThemeKey> getPrefMode() async {
    final mode = await _getStringValue(ARG_PREF_MODE);
    return enumFromString(mode, ThemeKey.values);
  }

  clearUserAccessToken() => _setStringValue(ARG_ACCESS_TOKEN, null);

  setPrefMode(ThemeKey _key) => _setStringValue(ARG_PREF_MODE, enumToString(_key));

  setUserAccessToken(TokenModel token) {
//    _setStringValue(ARG_USER_ID, token.user_id);
    _setStringValue(ARG_TOKEN_TYPE, token.token_type);
    _setStringValue(ARG_EXPIRES_AT, token.expires);
    return _setStringValue(ARG_ACCESS_TOKEN, token.access_token);
  }

  // Base functions
  Future<String> _getStringValue(String prefsName) =>
      preferences.then((prefs) => prefs.getString(prefsName));

  _setStringValue(String prefsName, String value) =>
      preferences.then((prefs) => prefs.setString(prefsName, value));

  Future clear() async => (await preferences).clear();
}
