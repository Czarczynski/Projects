import 'dart:async';
import 'dart:io';

import 'package:github_app/api/error/error_handler.dart';
import 'package:github_app/app_config.dart';
import 'package:github_app/store/account_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GithubHttpClient {
  static final GithubHttpClient _instance = new GithubHttpClient._internal();

  factory GithubHttpClient() => _instance;

  final Dio _dioClient = Dio();

  GithubHttpClient._internal() {
    _dioClient.options.baseUrl = AppConfig.HOST_URL;

    _handleDioInterceptors();
  }

  Future<Response> get(url, {Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(
          _dioClient.get(url, options: Options(headers: headers))).catchError((error){
            print(error);
      });

  Future<Response> post(url, {Map<String, dynamic> body, Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(
          _dioClient.post(url, data: body, options: Options(headers: headers))
      );

  _handleDioInterceptors() {
    _dioClient.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      debugPrint("Request: ${options.path}\n${options.headers.toString()}");
      String accessToken = await AccountManager().getAccessToken();
      if (accessToken?.isNotEmpty ?? false) {
        // ignore: unnecessary_brace_in_string_interps
        options.headers[HttpHeaders.authorizationHeader] = 'Basic ${accessToken}';
      }

      options.headers[HttpHeaders.acceptHeader] = "application/vnd.github.v3+json";
      return options;
    }, onResponse: (Response response) async {
      debugPrint("Response: (${response.statusCode}) ${response.request.path}\n${response.data}");
      return response;
    }));
  }
}
