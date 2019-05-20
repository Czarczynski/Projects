import 'package:flutter/material.dart';
import './textChanger.dart';
import './formTester.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'Second App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = "Hello Wrold.", _dest = 'assets/food.jpg';
  int counter = 0, counter2 = 0;

  _textChanger() {
    setState(() {
      counter++;
      switch (counter) {
        case 1:
          _text = "Second dish.";
          _dest = 'assets/food1.jpg';
          break;
        case 2:
          _text = "Third dish.";
          _dest = 'assets/food2.jpg';
          break;
        case 3:
          _text = "Fourth dish.";
          _dest = 'assets/food3.jpg';
          break;
        case 4:
          _text = "Fifth dish";
          _dest = 'assets/food4.jpg';
          break;
        default:
          _text = "First dish.";
          _dest = 'assets/food.jpg';
          break;
      }
      if (counter == 5) counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                //margin: EdgeInsets.only(left: 1),
                children: [
              Row(children: [
                RaisedButton(
                    onPressed: (counter2 == 1) ? null : _textChanger,
                    child: Text('Next dish')),
                RaisedButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      setState(() {
                        if (counter2 == 1) counter2 = -1;
                        counter2++;
                      });
                    },
                    child: Text('Change View')),
                Text("  |  ")
              ]),
              (counter2 == 1)
                  ? Text('Form',
                      style: TextStyle(
                          letterSpacing: 5.0,
                          color: Colors.deepOrangeAccent,
                          fontSize: 35))
                  : Text('Food',
                      style: TextStyle(
                          letterSpacing: 5.0,
                          color: Colors.deepOrangeAccent,
                          fontSize: 35))
            ])),
        body: (counter2 == 1) ? formTester() : textChanger(_dest, _text));
  }
}
