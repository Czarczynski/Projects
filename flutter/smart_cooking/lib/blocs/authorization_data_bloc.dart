import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/authorization_data_model.dart';
import 'package:smart_cooking/store/account_manager.dart';

class AuthorizationDataBloc {
  final String _code;
  final AccountManager _accountManager = AccountManager();

  AuthorizationDataBloc(this._code);

  signToken() async {
    _accountManager.setUserAccessToken(await _fetchAuthorizationData());
  }

  Future<AuthorizationData> _fetchAuthorizationData() async {
    try {
      final response =
          await AppuniteHttpClient().post('/api/v1/oauth/token', body: {
        'code': _code,
        'client_secret': AppConfig.CLIENT_SECRET,
        'client_id': AppConfig.CLIENT_ID
      });
      if (response.statusCode == 200) {
        print(response.data);
        return AuthorizationData.fromJson(response.data);
      } else {
        throw Exception('Failed while fetching authorization data');
      }
    } catch (error) {
      throw error;
    }
  }
}
