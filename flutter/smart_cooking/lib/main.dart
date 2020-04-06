import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/theme_changer.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/login_page.dart';
import 'package:smart_cooking/store/account_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ThemeChanger(
      child: SmartCooking(),
      initialThemeKey: await AccountManager().getPrefMode()));
}

class SmartCooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        Config.ROUTE_TO_LOGIN: (context) => LoginPage(),
        Config.ROUTE_TO_DASHBOARD: (context) => DashboardPage(),
      },
      theme: ThemeChanger.of(context),
      debugShowCheckedModeBanner: false,
      title: "Smart Cooking",
      home: LoginPage(),
    );
  }
}
