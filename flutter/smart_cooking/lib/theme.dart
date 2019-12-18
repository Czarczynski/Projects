import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

mixin CustomThemes {
  final walletTheme = ThemeData(
    backgroundColor: ThemeConfig.WHITE_SMOKE,
    accentColor: ThemeConfig.MINT_GREEN,
    disabledColor: ThemeConfig.BLUE_CYAN,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ThemeConfig.PURPLE_,
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: ThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: ThemeConfig.WHITE_SMOKE,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: ThemeConfig.PURPLE_,
      ),
    ),
    iconTheme: IconThemeData(
      color: ThemeConfig.PURPLE_,
    ),
    textTheme: TextTheme(
        title: TextStyle(
          color: ThemeConfig.BLUE_GRAY,
          fontFamily: 'DMSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        display1: TextStyle(
          color: ThemeConfig.GRAY_DARK,
          fontFamily: 'DMSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display2: TextStyle(
            color: Colors.white,
            fontFamily: 'DMSans',
            fontSize: 20,
            fontWeight: FontWeight.w700),
        display4: TextStyle(
          color: ThemeConfig.ST_TROPAZ,
          fontFamily: 'DMSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        display3: TextStyle(
            color: ThemeConfig.RED_NEAR_VENETIAN,
            fontFamily: 'DMSans',
            fontSize: 14,
            fontWeight: FontWeight.w700),
        button: TextStyle(
            color: Colors.white,
            fontFamily: 'DMSans',
            fontSize: 20,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500),
        body1: TextStyle(
            color: ThemeConfig.BLUE_GRANADE,
            fontFamily: 'OpenSans',
            fontSize: 12),
        caption: TextStyle(
          color: Colors.white,
          fontFamily: 'DMSans',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        subhead: TextStyle(
          color: Color(0xFF242b34),
          fontFamily: 'DMSans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        )),
  );
}
