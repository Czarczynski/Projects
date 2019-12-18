import 'package:smart_cooking/app_config.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar flush;
bool mainButton;

showFlushBar(
  BuildContext context,
  String mainText,
  String buttonText, [
  void _buttonPress(),
]) {
  flush = Flushbar(
    messageText: Align(
      alignment: Alignment.centerLeft,
      child: Text(mainText, style: Theme.of(context).textTheme.caption),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: ThemeConfig.BLUE_GRAY,
    boxShadows: <BoxShadow>[
      BoxShadow(
          color: Color.fromRGBO(36, 43, 52, 0.5),
          offset: Offset(0, 4),
          blurRadius: 20)
    ],

    padding: EdgeInsets.only(left: 8, right: 8),
    borderRadius: 4,
    flushbarPosition: FlushbarPosition.BOTTOM,
    mainButton: FlatButton(
      onPressed: () {
        _buttonPress();
        flush.dismiss();
      },
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.display3,
        textAlign: TextAlign.right,
      ),
    ),
  )..show(context);
}
