class AuthorizeResponseUrl {
  // ignore: non_constant_identifier_names
  final String authorized_url;

  AuthorizeResponseUrl(this.authorized_url);

  factory AuthorizeResponseUrl.fromJson(Map<String, dynamic> json) {
    return AuthorizeResponseUrl(json['authorized_url']);
  }
}
