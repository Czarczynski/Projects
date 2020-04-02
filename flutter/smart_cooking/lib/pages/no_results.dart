import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/ic_placeholder.png',
            height: 64,
            width: 64,
          ),
          Text(EnglishVer.EMPTY),
        ],
      ),
    );
  }
}
