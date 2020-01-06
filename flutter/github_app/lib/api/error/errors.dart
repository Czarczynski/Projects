import 'dart:convert';

import 'package:github_app/model/error_response.dart';

abstract class DefaultError {
  String getMessage();
}

class NetworkError implements DefaultError {
  @override
  String getMessage() => "No internet connection";
}

class ForbiddenServerError implements DefaultError {
  final dynamic responseData;

  ForbiddenServerError(this.responseData);

  @override
  String getMessage() => "(403) ${_getErrorResponseMessage(responseData)}";
}

class NotFoundError implements DefaultError {
  @override
  String getMessage() => "(404) not found";
}

class UnauthorizedError implements DefaultError {
  final dynamic responseData;

  UnauthorizedError(this.responseData);

  @override
  String getMessage() => "(401) Unathorized connection";
}

class UnknownClientError implements DefaultError {
  @override
  String getMessage() {
    if (_errorResponse is ErrorResponse) {
      return (_errorResponse as ErrorResponse)?.message ?? "Unknown server error : $errorResponse";
    } else {
      return errorResponse.toString();
    }
  }

  final dynamic _errorResponse;

  UnknownClientError(this._errorResponse);

  get errorResponse => _errorResponse;
}

class UnknownServerError implements DefaultError {
  final dynamic responseData;

  @override
  String getMessage() => _getErrorResponseMessage(responseData);

  UnknownServerError(this.responseData);
}

String _getErrorResponseMessage(String body) =>
    ErrorResponse.fromJson(jsonDecode(body))?.message ?? body;
