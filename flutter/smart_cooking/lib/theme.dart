import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

enum ThemeKey { LIGHT , DARK }

class CustomThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: LightThemeConfig.WHITE_SMOKE,
    accentColor: Colors.grey.withOpacity(0.5),
    disabledColor: LightThemeConfig.BLUE_CYAN,
    canvasColor: LightThemeConfig.ST_TROPAZ,
    buttonColor: LightThemeConfig.BLUE_LIGHT_GRAY,
    cursorColor: LightThemeConfig.REAL_BLACK,
    hoverColor: LightThemeConfig.VIOLENT_START,
    focusColor: LightThemeConfig.VIOLENT_END,
    highlightColor: LightThemeConfig.WHITE_70,
    cardColor: LightThemeConfig.BLACK_54,
    selectedRowColor: Colors.black12,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: LightThemeConfig.PURPLE_,
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: LightThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: LightThemeConfig.WHITE_SMOKE,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: LightThemeConfig.PURPLE_,
      ),
    ),
    iconTheme: IconThemeData(
      color: LightThemeConfig.PURPLE_,
    ),
    textTheme: TextTheme(
        title: TextStyle(
          color: LightThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        display1: TextStyle(
          color: LightThemeConfig.WHITE,
          fontFamily: 'DMSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display2: TextStyle(
            color: LightThemeConfig.WHITE,
            fontFamily: 'DMSans',
            fontSize: 20,
            fontWeight: FontWeight.w700),
        display4: TextStyle(
          color: LightThemeConfig.ST_TROPAZ,
          fontFamily: 'DMSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display3: TextStyle(
            color: LightThemeConfig.VENETIAN_RED,
            fontFamily: 'DMSans',
            fontSize: 14,
            fontWeight: FontWeight.w700),
        button: TextStyle(
            color: LightThemeConfig.WHITE,
            fontFamily: 'DMSans',
            fontSize: 20,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500),
        body1: TextStyle(
            color: LightThemeConfig.BLUE_GRANADE,
            fontFamily: 'OpenSans',
            fontSize: 12),
        caption: TextStyle(
          color: LightThemeConfig.WHITE,
          fontFamily: 'DMSans',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        subhead: TextStyle(
          color: LightThemeConfig.BLACK,
          fontFamily: 'DMSans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        )),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: DarkThemeConfig.WHITE_SMOKE,
    accentColor: Colors.grey.withOpacity(0.5),
    disabledColor: DarkThemeConfig.BLUE_CYAN,
    canvasColor: DarkThemeConfig.ST_TROPAZ,
    buttonColor: DarkThemeConfig.BLUE_LIGHT_GRAY,
    cursorColor: DarkThemeConfig.REAL_BLACK,
    hoverColor: DarkThemeConfig.VIOLENT_START,
    focusColor: DarkThemeConfig.VIOLENT_END,
    highlightColor: DarkThemeConfig.WHITE_70,
    cardColor: DarkThemeConfig.BLACK_54,
    selectedRowColor: Colors.white12,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: DarkThemeConfig.PURPLE_,
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: DarkThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: DarkThemeConfig.WHITE_SMOKE,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: DarkThemeConfig.PURPLE_,
      ),
    ),
    iconTheme: IconThemeData(
      color: DarkThemeConfig.PURPLE_,
    ),
    textTheme: TextTheme(
        title: TextStyle(
          color: DarkThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        display1: TextStyle(
          color: DarkThemeConfig.GRAY_DARK,
          fontFamily: 'DMSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display2: TextStyle(
            color: DarkThemeConfig.WHITE,
            fontFamily: 'DMSans',
            fontSize: 20,
            fontWeight: FontWeight.w700),
        display4: TextStyle(
          color: DarkThemeConfig.ST_TROPAZ,
          fontFamily: 'DMSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display3: TextStyle(
            color: DarkThemeConfig.VENETIAN_RED,
            fontFamily: 'DMSans',
            fontSize: 14,
            fontWeight: FontWeight.w700),
        button: TextStyle(
            color: DarkThemeConfig.WHITE,
            fontFamily: 'DMSans',
            fontSize: 20,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500),
        body1: TextStyle(
            color: DarkThemeConfig.BLUE_GRANADE,
            fontFamily: 'OpenSans',
            fontSize: 12),
        caption: TextStyle(
          color: DarkThemeConfig.WHITE,
          fontFamily: 'DMSans',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        subhead: TextStyle(
          color: DarkThemeConfig.BLACK,
          fontFamily: 'DMSans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        )),
  );

  static ThemeData getThemeFromKey(ThemeKey themeKey) {
    switch (themeKey) {
      case ThemeKey.LIGHT:
        return lightTheme;
      case ThemeKey.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
