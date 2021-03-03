import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  String _title, _text;

  CardComponent({title = "", text = ""}) {
    this._title = title;
    this._text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                _title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Theme.of(context).canvasColor),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                _text,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Theme.of(context).canvasColor),
              ),
            ],
          ),
        ));
  }
}
