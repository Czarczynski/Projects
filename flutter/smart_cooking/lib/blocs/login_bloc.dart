import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_cooking/blocs/token_bloc.dart';
import 'package:smart_cooking/store/account_manager.dart';

import '../app_config.dart';

class LoginBloc {

  bool _show = false;
  bool get show => _show;
  LoginBloc(BuildContext context) {
    AccountManager().getAccessToken().asStream().listen(
      (userToken) async {
        TokenBloc _bloc =
        TokenBloc("tomasz@gmail.com", "Test123");
        await _bloc.signToken();
        if (userToken != null && userToken.isNotEmpty) {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    Config.ROUTE_TO_DASHBOARD,
                    (Route<dynamic> route) => false);
        }
        _show = true;
      },
    );
  }
}

bool hasToken() {
  AccountManager().getAccessToken().then((userToken) {
    if(userToken != null && userToken.isNotEmpty)
      return true;
    return false;
  });
}
