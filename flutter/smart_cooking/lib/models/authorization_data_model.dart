class AuthorizationData {
  AuthorizationData(this.user_id, this.token_type, this.refresh_token,
      this.expires_at, this.access_token);

  // ignore: non_constant_identifier_names
  final String user_id, token_type, refresh_token, expires_at, access_token;

  factory AuthorizationData.fromJson(Map<String, dynamic> json) {
    return AuthorizationData(json['user_id'], json['token_type'],
        json['refresh_token'], json['expires_at'], json['access_token']);
  }
}
