import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/token_bloc.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GoogleWebPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _GoogleWebPageWidget();
  }
}

class _GoogleWebPageWidget extends StatefulWidget {

  @override
  _GoogleWebPageState createState() => _GoogleWebPageState();
}

class _GoogleWebPageState extends State<_GoogleWebPageWidget> {
  final _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
  }

  @override
  void dispose() {
    _flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
