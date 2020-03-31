import 'dart:async';

import 'package:dio/dio.dart';
import 'package:smart_cooking/api/network_api_client.dart';

Future<Response> postStarred(String id) async {
  try {
    var response = await SmartCookingHttpClient()
        .post("/PostStarred?starredId=$id", body: null);
    if (response.statusCode == 200) {
      return response;
    } else
      throw Exception("Status Code: ${response.statusCode}");
  } catch (error) {
    throw error;
  }
}
