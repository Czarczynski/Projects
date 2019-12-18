import 'package:dio/dio.dart';

import '../network_api_client.dart';

class AuthApiProvider {
  Future<Response> authorizeUser(Map<String, String> clientBody) async =>
      AppuniteHttpClient()
          .post('/api/v1/oauth/authorized_url', body: clientBody);
}
