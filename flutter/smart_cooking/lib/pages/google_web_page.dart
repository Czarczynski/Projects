import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/authorization_data_bloc.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GoogleWebPage extends StatelessWidget {
  final String _url;

  GoogleWebPage(this._url);

  @override
  Widget build(BuildContext context) {
    return _GoogleWebPageWidget(_url);
  }
}

class _GoogleWebPageWidget extends StatefulWidget {
  final String _url;

  _GoogleWebPageWidget(this._url);

  @override
  _GoogleWebPageState createState() => _GoogleWebPageState();
}

class _GoogleWebPageState extends State<_GoogleWebPageWidget> {
  final _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    _flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      Map<String, String> queryParameters =
          Uri.dataFromString(url).queryParameters;
      if (queryParameters.containsKey("code")) {
        AuthorizationDataBloc bloc =
            AuthorizationDataBloc(queryParameters["code"]);
        await bloc.signToken();
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      }
    });
  }

  @override
  void dispose() {
    _flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Container(
            height: 26,
            width: 204,
            child: Text(
              EngStrings.GOOGLE_SIGN_IN,
            )),
      ),
      userAgent: AppConfig.USER_AGENT,
      url: '${widget._url}',
      withJavascript: true,
      withLocalStorage: false,
    );
  }
}
