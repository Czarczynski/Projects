import 'package:flutter/material.dart';
import 'package:smart_cooking/store/account_manager.dart';
import 'package:smart_cooking/theme.dart';

class _ThemeSet extends InheritedWidget {
  final ThemeChangerState data;

  _ThemeSet({
    this.data,
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_ThemeSet oldWidget) {
    return true;
  }
}

class ThemeChanger extends StatefulWidget {
  final Widget child;
  final ThemeKey initialThemeKey;

  const ThemeChanger({
    Key key,
    this.initialThemeKey,
    @required this.child,
  }) : super(key: key);

  @override
  ThemeChangerState createState() => new ThemeChangerState();

  static ThemeData of(BuildContext context) {
    _ThemeSet inherited =
    (context.dependOnInheritedWidgetOfExactType<_ThemeSet>());
    return inherited.data.theme;
  }

  static ThemeChangerState instanceOf(BuildContext context) {
    _ThemeSet inherited =
    (context.dependOnInheritedWidgetOfExactType<_ThemeSet>());
    return inherited.data;
  }
}

class ThemeChangerState extends State<ThemeChanger> {
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = CustomThemes.getThemeFromKey(widget.initialThemeKey);
    super.initState();
  }



  void changeTheme(ThemeKey themeKey) {
    setState(() {
      _theme = CustomThemes.getThemeFromKey(themeKey);
      AccountManager().setPrefMode(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _ThemeSet(
      data: this,
      child: widget.child,
    );
  }
}

String enumToString(ThemeKey o) => o.toString().split('.').last;

ThemeKey enumFromString(String key, List<ThemeKey> values) =>
    values.firstWhere((v) => key == enumToString(v), orElse: () => ThemeKey.DARK);