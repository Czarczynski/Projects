import 'package:smart_cooking/api/error/errors.dart';
import 'package:flutter/material.dart';

class WalletUtils {
  static showErrorSnackbar(BuildContext context, dynamic error) {
    var errorMessage = "";

    if (error is DefaultError) {
      errorMessage = error.getMessage();
    } else {
      errorMessage = error.toString();
    }

    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$errorMessage'),action: SnackBarAction(label: 'dismiss', onPressed: (){})));
  }
}
