import 'dart:io';

import 'package:github_app/api/github_http_client.dart';
import 'package:dio/dio.dart';

class AuthApiProvider {
  final GithubHttpClient client = GithubHttpClient();

  Future<Response> authorizeUser(String token) async =>
      client.get('/authorizations', headers: {HttpHeaders.authorizationHeader: 'Basic $token'});
}
