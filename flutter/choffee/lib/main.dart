import 'dart:async';

import 'package:choffee/Pages/HomePage.dart';
import 'package:choffee/Theme.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => CustomThemes.getTheme(brightness),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            routes: <String, WidgetBuilder>{
              "/home": (context) => HomePage(title: "Choffee")
            },
            debugShowCheckedModeBanner: false,
            title: 'Choffee',
            theme: theme,
            home: new Welcome(),
          );
        });
  }
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  double _padding = 0, _paddingOutside = 0;

  @override
  void initState() {
    super.initState();
    new Timer(Duration(milliseconds: 2000), () {
      setState(() {
        this._padding = 400;
        this._paddingOutside = 70;
      });
      new Timer(Duration(milliseconds: 700), () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/home", (Route<dynamic> route) => false);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Center(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Theme.of(context).backgroundColor,
                  child: AnimatedPadding(
                    duration: Duration(milliseconds: 550),
                    padding: EdgeInsets.all(this._paddingOutside),
                    child: AnimatedPadding(
                      duration: Duration(milliseconds: 550),
                      padding: EdgeInsets.only(bottom: this._padding),
                      child: Image.asset("assets/images/pour-over.png",
                          color: Theme.of(context).primaryColor),
                    ),
                  )))),
    );
  }
}
