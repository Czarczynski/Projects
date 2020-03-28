import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/models/token_model.dart';
import 'package:smart_cooking/store/account_manager.dart';

class TokenBloc {
  final String login, password;
  final AccountManager _accountManager = AccountManager();

  TokenBloc(this.login, this.password);

  signToken() async {
    _accountManager.setUserAccessToken(await _fetchTokenModel());

  }

  Future<TokenModel> _fetchTokenModel() async {
    try {
      final response = await SmartCookingHttpClient().post('/token', body: {
        "grant_type": "password",
        'username': login,
        'password': password
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded"
      });
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception('Failed while fetching authorization data');
      }
    } catch (error) {
      throw error;
    }
  }
}
