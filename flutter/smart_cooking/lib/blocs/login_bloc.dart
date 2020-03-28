import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/token_bloc.dart';
import 'package:smart_cooking/pages/google_web_page.dart';
import 'package:smart_cooking/store/account_manager.dart';
import 'package:flutter/material.dart';

class LoginBloc {

  LoginBloc(BuildContext context) {
        AccountManager().getAccessToken().asStream().listen(
          (userToken) async{

            TokenBloc _bloc = TokenBloc("tomasz@gmail.com", "Test123");
            await _bloc.signToken();
            if (userToken != null && userToken.isNotEmpty) {

              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppConfig.ROUTE_TO_DASHBOARD,
                      (Route<dynamic> route) => false);
            } else {
              _goToRegisterPage(context);
            }
          },
        );
  }

  _goToRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoogleWebPage(),
      ),
    );
  }
}
