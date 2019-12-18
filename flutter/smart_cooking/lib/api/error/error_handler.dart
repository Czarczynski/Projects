import 'package:dio/dio.dart';

import 'errors.dart';

class ErrorHandler {
  static Future<Response> makeRequestWithErrorHandler(
      Future<Response> requestFunction) async {
    try {
      return await requestFunction;
    } on DioError catch (e) {
      throw ErrorHandler.handleDioError(e);
    }
  }

  static DefaultError handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
        return NetworkError();
      case DioErrorType.RESPONSE:
        return _handleResponseError(error);
      default:
        return UnknownClientError(error.error);
    }
  }

  static DefaultError _handleResponseError(DioError error) {
    final statusCode = error.response.statusCode;
    final dynamic errorResponseData = error.response.data;

    if (statusCode == 401) {
      return UnauthorizedError(errorResponseData);
    } else if (statusCode == 403) {
      return ForbiddenServerError(errorResponseData);
    } else if (statusCode == 404) {
      return NotFoundError();
    } else if (statusCode >= 500 && statusCode <= 599) {
      return UnknownServerError(errorResponseData);
    } else {
      return UnknownClientError(errorResponseData);
    }
  }
}
