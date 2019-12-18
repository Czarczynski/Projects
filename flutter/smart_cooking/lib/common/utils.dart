import 'package:smart_cooking/api/error/errors.dart';
import 'package:smart_cooking/custom-painters/custom_flushbar.dart';
import 'package:flutter/material.dart';

class WalletUtils {
  static showErrorSnackbar(BuildContext context, dynamic error) {
    var errorMessage = "";

    if (error is DefaultError) {
      errorMessage = error.getMessage();
    } else {
      errorMessage = error.toString();
    }

    showFlushBar(context, '$errorMessage', 'Dismiss', (){});
  }
}
