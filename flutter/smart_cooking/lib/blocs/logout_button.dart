import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/store/account_manager.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  FlatButton flatButton(BuildContext context, String text, Function onPressed) {
    return FlatButton(
      onPressed: onPressed,
      highlightColor: Colors.grey,
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
              contentTextStyle: Theme.of(context).textTheme.display1,
              content: Text(EngStrings.QUESTION_SURE,
                  style: Theme.of(context).textTheme.title),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              actions: <Widget>[
                flatButton(context, EngStrings.YES, () {
                  AccountManager().clearUserAccessToken();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppConfig.ROUTE_TO_LOGIN,
                      (Route<dynamic> route) => false);
                }),
                flatButton(context, EngStrings.NO, () {
                  Navigator.of(context).pop();
                }),
              ],
            );
          },
        );
      },
      child: Icon(Icons.exit_to_app, color: ThemeConfig.PURPLE_),
    );
  }
}
