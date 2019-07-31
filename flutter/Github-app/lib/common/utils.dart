import 'package:github_app/api/error/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GithubUtils {
  static showErrorSnackbar(BuildContext context, dynamic error) {
    var errorMessage = "";

    if (error is DefaultError) {
      errorMessage = error.getMessage();
    } else {
      errorMessage = error.toString();
    }

    final snackBar = SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
      duration: Duration(milliseconds: 3000),
    );

    debugPrint(errorMessage);
    hideKeyboard();
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
