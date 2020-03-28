import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/pages/login_page.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(WalletApp());

class WalletApp extends StatelessWidget with CustomThemes {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        AppConfig.ROUTE_TO_LOGIN: (context) => LoginPage(),
        AppConfig.ROUTE_TO_DASHBOARD: (context) => DashboardPage(),
      },
      theme: walletTheme,
      debugShowCheckedModeBanner: false,
      title: "Smart Cooking",
      home: LoginPage(),
    );
  }
}
