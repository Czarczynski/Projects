import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/get_refresh_token.dart';
import 'package:dio/dio.dart';

import './error/error_handler.dart';
import '../store/account_manager.dart';

class AppuniteHttpClient {
  static final AppuniteHttpClient _instance = AppuniteHttpClient._internal();

  factory AppuniteHttpClient() => _instance;
  final Dio _dioClient = Dio();

  AppuniteHttpClient._internal() {
    _handleDioInterceptors();
    _dioClient.options.baseUrl = AppConfig.HOST_URL;
  }

  Future<Response> get(url, {Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(
          _dioClient.get(url, options: Options(headers: headers)));

  Future<Response> post(url,
          {Map<String, dynamic> body, Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(_dioClient.post(url,
          data: jsonEncode(body), options: Options(headers: headers)));

  _handleDioInterceptors() {
    _dioClient.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String xAuthToken = await AccountManager().getAccessToken();

      if (xAuthToken?.isNotEmpty ?? false) {
        DateTime expiresAt =
            DateTime.parse(await AccountManager().getExpiresAt())
                .add(DateTime.now().timeZoneOffset);
        DateTime currentTime = DateTime.now();
        if (currentTime.difference(expiresAt).inMilliseconds > 0) {
          GetRefreshToken(await AccountManager().getRefreshToken(),
              await AccountManager().getAccessToken());
          xAuthToken = await AccountManager().getAccessToken();
        }
        options.headers['x-auth-token'] = '$xAuthToken';
      }
      options.headers[HttpHeaders.acceptHeader] = "application/json";
      options.headers[HttpHeaders.contentTypeHeader] = "application/json";
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (error) async {
      return error;
    }));
  }
}
