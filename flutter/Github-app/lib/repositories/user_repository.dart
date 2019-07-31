import 'dart:convert';
import 'dart:io';

import 'package:github_app/api/network_provider/auth_api_provider.dart';
import 'package:github_app/store/account_manager.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() => _instance;

  final AccountManager _accountManager = AccountManager();
  final AuthApiProvider _authApiProvider = AuthApiProvider();

  UserRepository._internal();

  Future<Response> authenticate(String email, String password) async {
    final token = _getToken(email, password);
    final response = await _authApiProvider.authorizeUser(token);

    if (response.statusCode == HttpStatus.ok) {
      _accountManager.setUserAccessToken(token);
    }
    return response;
  }

  _getToken(String email, String password) => base64.encode("$email:$password".codeUnits);
}
