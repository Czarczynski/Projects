class TokenModel{
  final String access_token, token_type, expires; // ignore: non_constant_identifier_names

  TokenModel(this.access_token, this.token_type, this.expires);

  factory TokenModel.fromJson(Map<String, dynamic> json){
    return TokenModel(json['access_token'], json['token_type'], json['.expires']);
  }
}