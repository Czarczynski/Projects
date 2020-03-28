import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatelessWidget {
  final String _url;

  WebPage(this._url);

  @override
  Widget build(BuildContext context) {
//    return WebviewScaffold(
//      appBar: AppBar(),
//      userAgent: AppConfig.USER_AGENT,
//      url: _url,
//      withJavascript: true,
//      withLocalStorage: false,
//    );
  }
}
