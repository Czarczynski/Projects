import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_cooking/blocs/login_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  bool oldWidget;

  LoginPage({this.oldWidget = false});

  @override
  _LoginPageState createState() => _LoginPageState(oldWidget: oldWidget);
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Timer _timer;
  bool show = false, isLogged = false;

  _LoginPageState({oldWidget = false}) {
    _timer = new Timer(Duration(milliseconds: oldWidget ? 0 : 2500), () {
        LoginBloc(context);
      setState(() {
        show = true;
      });
    });
  }

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      upperBound: 0.3,
      vsync: this,
      duration: Duration(milliseconds: 2800),
    )..addListener(() => setState(() {}));

    animation = CurvedAnimation(
        reverseCurve: Curves.easeInOut,
        parent: animationController,
        curve: Curves.elasticOut);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _timer.cancel();
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF2c3541), Color(0xFF475970)])),
              child: Image.asset(
                "assets/images/logo3.png",
                frameBuilder: (BuildContext context, Widget child, int frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return _myColumn(context, child, show);
                  }
                  return AnimatedOpacity(
                    alwaysIncludeSemantics: true,
                    child:
                        _myColumn(context, child, show, animation: animation),
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ),
          )),
    );
  }
}

Column _myColumn(BuildContext context, Widget child, bool changer,
    {animation = null}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: animation == null
            ? child
            : ScaleTransition(scale: animation, child: child),
      ),
      AnimatedContainer(
        curve: Curves.easeInQuad,
        height: animation == null ? 200 : changer ? 200 : 0,
        duration: Duration(milliseconds: 1300),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Please, continue without logging"),
                      action: SnackBarAction(
                        onPressed: () {},
                        label: "Ok",
                      ),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Theme.of(context).textTheme.display2.color,
                    ),
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.subhead.color)),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    LoginBloc(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: Text("Continue without signing",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Colors.grey)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
