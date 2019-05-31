import 'package:flutter/material.dart';
import './textChanger.dart';
import './formTester.dart';
import './saveChoise.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  String _text = "Hello World.", _dest = 'assets/food.jpg';
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
                    onPressed: (counter2 == 0) ? _textChanger : null,
                    child: Text('Next dish')),
                RaisedButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      setState(() {
                        if (counter2 == 2) counter2 = -1;
                        counter2++;
                      });
                    },
                    child: Text('Change View')),
                Text("  |  ")
              ]),
              (counter2 == 1)
                  ? Text('Form',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          letterSpacing: 5.0,
                          color: Colors.deepOrangeAccent,
                          fontSize: 35))
                  : (counter2 == 2)
                      ? Text('Save',
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
        body: (counter2 == 1)
            ? formTester()
            : (counter2 == 2) ? savePoint() : textChanger(_dest, _text)
        //     ,
        // floatingActionButton: (counter2 == 2)
        //     ? FloatingActionButton(
        //         onPressed: () {
        //           return showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return AlertDialog(
        //                     title: Text('Elements'),
        //                     content: Row(children: <Widget>[
        //                       Column(
        //                           children: _list
        //                               .map((element) =>
        //                                   Card(child: Text(element)))
        //                               .toList())
        //                     ]));
        //               });
        //         },
        //         tooltip: 'showData',
        //         child: Icon(Icons.menu))
        //     : null
        );
  }
}
