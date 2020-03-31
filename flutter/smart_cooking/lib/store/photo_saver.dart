import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

void saveImage(BuildContext _context, String _path) async {
  return showDialog(
      context: _context,
      builder: (BuildContext context) {
        Duration(milliseconds: 2000);
        return Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 2 - 100,
              vertical: MediaQuery.of(context).size.height / 2 - 100),
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Save Photo?",
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Text("Yes",
                        style: TextStyle(
                            color: Colors.green,
                            backgroundColor: Colors.transparent,
                            fontSize: 20)),
                    onTap: () {
                      GallerySaver.saveImage(_path).then((bool success) {
                      Navigator.of(context).pop();
                      Scaffold.of(_context).showSnackBar(
                        SnackBar(
                            content: Text("Saved",
                                style: TextStyle(color: Colors.green))),
                      );
                      });
                    },
                  ),
                  InkWell(
                    child: Text("No",
                        style: TextStyle(
                            color: Colors.red,
                            backgroundColor: Colors.transparent,
                            fontSize: 20)),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
