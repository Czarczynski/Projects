import 'package:flutter/material.dart';

class savePoint extends StatefulWidget {
  savePoint({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<savePoint> {
  List<String> _list = ['Wybór zero'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Column(children: <Widget>[
          RaisedButton(
              onPressed: (_list.contains('Wybór jeden'))
                  ? null
                  : () {
                      _list.add('Wybór jeden');
                    },
              child: Text('Wybór jeden')),
          RaisedButton(
              onPressed: (_list.contains('Wybór dwa'))
                  ? null
                  : () {
                      _list.add('Wybór dwa');
                    },
              child: Text('Wybór dwa')),
          RaisedButton(
              onPressed: (_list.contains('Wybór trzy'))
                  ? null
                  : () {
                      _list.add('Wybór trzy');
                    },
              child: Text('Wybór trzy')),
          FloatingActionButton(
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text('Elements'),
                          content: Row(children: <Widget>[
                            Column(
                                children: _list
                                    .map(
                                        (element) => Card(child: Text(element)))
                                    .toList())
                          ]));
                    });
              },
              tooltip: 'showData',
              child: Icon(Icons.menu))
        ])
      ], padding: EdgeInsets.only(top: 50)),
    );
  }
}
