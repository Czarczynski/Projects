import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.width),
          child: AppBar(
            iconTheme: IconThemeData(color: Color(0xFFef7853)),
            elevation: 0.0,
            flexibleSpace: Image(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/appbarlogo.jpeg'),
            ),
          ),
        ),
        body: Container());
  }
}
