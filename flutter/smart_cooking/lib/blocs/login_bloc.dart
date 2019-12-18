import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/authorize_url_to_google_bloc.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/models/authorizeUrl_model.dart';
//import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/google_web_page.dart';
import 'package:smart_cooking/store/account_manager.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  final AuthorizeUrlToGoogle _bloc = AuthorizeUrlToGoogle();

  LoginBloc(BuildContext context) {
    _bloc.getAuthorizeUrl().then(
      (data) {
        AccountManager().getAccessToken().asStream().listen(
          (userToken) {
            if (userToken != null && userToken.isNotEmpty) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppConfig.ROUTE_TO_DASHBOARD,
                      (Route<dynamic> route) => false);
            } else {
              _goToGoogleWebPage(context, data);
            }
          },
        );
      },
    ).catchError(
      (_) {
        WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
      },
    );
  }

  _goToGoogleWebPage(BuildContext context, AuthorizeResponseUrl _response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoogleWebPage(_response.authorized_url),
      ),
    );
  }
}
