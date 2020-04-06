import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/store/account_manager.dart';

class LogoutButton extends StatelessWidget {
  FlatButton flatButton(BuildContext context, String text, Function onPressed) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.lightBlue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Theme.of(context).backgroundColor,
              titleTextStyle: Theme.of(context).textTheme.title,
              title: Text(EnglishVer.QUESTION_SURE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              actions: <Widget>[
                flatButton(context, EnglishVer.YES, () {
                  AccountManager().clearUserAccessToken();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Config.ROUTE_TO_LOGIN, (Route<dynamic> route) => false);
                }),
                flatButton(context, EnglishVer.NO, () {
                  Navigator.of(context).pop();
                }),
              ],
            );
          },
        );
      },
      child: Icon(Icons.exit_to_app, color: Theme.of(context).iconTheme.color),
    );
  }
}
