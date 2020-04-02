import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

class ConfirmVoteDialog extends StatelessWidget {

  final Function onYesClick;
  final Function onNoClick;

  ConfirmVoteDialog({this.onYesClick, this.onNoClick});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      contentTextStyle: Theme.of(context).textTheme.display1,
      content: Text(EnglishVer.QUESTION_SURE,
          style: Theme.of(context).textTheme.title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      actions: <Widget>[
        _flatButton(context, EnglishVer.YES, onYesClick),
        _flatButton(context, EnglishVer.NO, onNoClick),
      ],
    );
  }

  FlatButton _flatButton(
      BuildContext context, String text, Function onPressed) {
    return FlatButton(
      onPressed: onPressed,
      highlightColor: Colors.grey,
      child: Text(
        text,
        style: TextStyle(color: DarkThemeConfig.BLACK),
      ),
    );
  }
}
