import 'dart:async';

import 'package:smart_cooking/api/network_provider/auth_api_provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/authorizeUrl_model.dart';
import 'package:dio/dio.dart';

class AuthorizeUrlToGoogle {
  Future<AuthorizeResponseUrl> getAuthorizeUrl() async {
    try {
      Response response = await _fetchAuthorizeUrl();
      return AuthorizeResponseUrl.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<Response> _fetchAuthorizeUrl() {
    return AuthApiProvider().authorizeUser({
      "client_secret": AppConfig.CLIENT_SECRET,
      "client_id": AppConfig.CLIENT_ID
    });
  }
}
