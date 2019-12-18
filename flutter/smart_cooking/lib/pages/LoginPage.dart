import 'package:flutter/services.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light, child: _LoginPageState()),
    );
  }
}

class _LoginPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2c3541), Color(0xFF475970)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/images/logo.png"),
            ),
            button("assets/images/googlelogin_white.png", context),
            button("assets/images/applelogin_black.png", context),
            button("assets/images/facebooklogin_blue.png", context),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppConfig.ROUTE_TO_DASHBOARD,
                    (Route<dynamic> route) => false);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                child: Text("Kontynuuj bez logowania",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.grey)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

InkWell button(String image, context) => InkWell(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppConfig.ROUTE_TO_DASHBOARD, (Route<dynamic> route) => false);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fitWidth)),
      ),
    );
