import 'package:flutter/material.dart';

ThemeData githubTheme = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.blue,
    buttonColor: Colors.blue,
    textTheme: TextTheme(
      button: TextStyle(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      height: 52.0,
      highlightColor: Colors.blue[700],
      splashColor: Colors.blue[700],
      disabledColor: Colors.blue[100],
    ));

InputDecorationTheme inputs = new InputDecorationTheme(
  fillColor: Colors.white,
  filled: true,
);
