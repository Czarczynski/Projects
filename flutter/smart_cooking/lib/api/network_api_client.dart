import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_cooking/app_config.dart';
import 'package:dio/dio.dart';

import './error/error_handler.dart';
import '../store/account_manager.dart';

class SmartCookingHttpClient {
  static final SmartCookingHttpClient _instance = SmartCookingHttpClient._internal();
  bool external= false;
  factory SmartCookingHttpClient() => _instance;
  final Dio _dioClient = Dio();

  SmartCookingHttpClient._internal() {
    _handleDioInterceptors();
    _dioClient.options.baseUrl = AppConfig.HOST_URL;
  }

  Future<Response> get(url, {Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(
          _dioClient.get(url, options: Options(headers: headers)));

  Future<Response> post(url,
          {Map<String, dynamic> body, Map<String, dynamic> headers}) async =>
      ErrorHandler.makeRequestWithErrorHandler(_dioClient.post(url,
          data: body==null ? null : encodeMap(body), options: Options(headers: headers)));

  String encodeMap(Map data) {
    return data.keys.map((key) => "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}").join("&");
  }
  _handleDioInterceptors() {
    _dioClient.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String xAuthToken = await AccountManager().getAccessToken();

      if (xAuthToken?.isNotEmpty ?? false) {
//        DateTime expiresAt =
//            DateTime.parse(await AccountManager().getExpiresAt())
//                .add(DateTime.now().timeZoneOffset);
//        DateTime currentTime = DateTime.now();
//        if (currentTime.difference(expiresAt).inMilliseconds > 0) {
//          GetRefreshToken(await AccountManager().getRefreshToken(),
//              await AccountManager().getAccessToken());
//          xAuthToken = await AccountManager().getAccessToken();
//        }
        options.headers['Authorization'] = 'bearer $xAuthToken';
      }
      options.headers[HttpHeaders.acceptHeader] = "application/json";
//      options.headers[HttpHeaders.contentTypeHeader] = "application/x-www-form-urlencoded";
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (error) async {
      return error;
    }));
  }
}
