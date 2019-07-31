class ErrorResponse {
  String message;

  ErrorResponse(this.message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(json["message"]);
}
