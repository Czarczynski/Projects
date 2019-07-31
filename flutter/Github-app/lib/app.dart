import 'dart:async';

import 'package:github_app/pages/login/login_page.dart';
import 'package:github_app/pages/repositories/repositories_page.dart';
import 'package:github_app/store/account_manager.dart';
import 'package:github_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class GithubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GithubDemo",
        home: SplashPage(),
        theme: githubTheme);
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription<String> subscription;

  @override
  void initState() {
    subscription = Observable(AccountManager().getAccessToken().asStream())
        .delay(Duration(seconds: 1))
        .listen((userToken) {
      if (userToken != null && userToken.isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RepositoriesPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          child: Center(child: Image.asset("assets/images/github_logo.png")),
          tag: "logo",
        ),
      ),
    );
  }
}
