import 'package:flutter/material.dart';

class textChanger extends StatefulWidget {
  textChanger(this.dest, this.text, {Key key, this.title}) : super(key: key);

  final String title, dest, text;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<textChanger> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(children: [
      Column(children: <Widget>[
        Image.asset(widget.dest, width: 500, height: 200),
        Text(widget.text, style: Theme.of(context).textTheme.display1),
        Image.asset(widget.dest, width: 500, height: 200)
      ])
    ], padding: EdgeInsets.only(top: 50)));
  }
}
