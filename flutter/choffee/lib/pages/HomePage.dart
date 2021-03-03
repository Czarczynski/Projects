import 'package:choffee/Pages/DrawerPage.dart';
import 'package:choffee/components/Card.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      drawer: DrawerPage(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Text("Updates", style: Theme.of(context).textTheme.headline3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40.0),
              child: CardComponent(title: "Hey Maja!", text: "It's my new mobile App!"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
