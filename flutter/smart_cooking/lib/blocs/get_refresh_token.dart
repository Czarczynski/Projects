import 'dart:convert';

import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/authorization_data_model.dart';
import 'package:smart_cooking/store/account_manager.dart';
import 'package:http/http.dart' as http;

class GetRefreshToken {
  // ignore: non_constant_identifier_names
  final String refresh_token, access_token;

  GetRefreshToken(this.refresh_token, this.access_token) {
    fetchAuthorizationData().then((value) {
      AccountManager().setUserAccessToken(value);
    });
  }

  Future<AuthorizationData> fetchAuthorizationData() async {
    final response = await http.post(
        'https://wallet-staging-api.appunite.net/api/v1/oauth/refresh_token',
        body: {
          'refresh_token': '$refresh_token',
          'client_secret': '${AppConfig.CLIENT_SECRET}',
          'client_id': '${AppConfig.CLIENT_ID}',
          'access_token': '$access_token'
        });

    if (response.statusCode == 200) {
      return AuthorizationData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed while refreshing token');
    }
  }
}
