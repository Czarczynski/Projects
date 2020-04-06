import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../app_config.dart';

void saveImage(BuildContext _context, String _path) async {
  return showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: Text("Save Photo?", style: Theme.of(context).textTheme.title),
          actions: <Widget>[
            FlatButton(
              child: Text(EnglishVer.YES,
                  style: TextStyle(
                      color: Colors.lightBlue,
                      backgroundColor: Colors.transparent,
                      fontSize: 20)),
              onPressed: () {
                GallerySaver.saveImage(_path).then((bool success) {
                  Navigator.of(context).pop();
                  Scaffold.of(_context).showSnackBar(
                    SnackBar(
                        content: Text("Saved",
                            style: TextStyle(color: Colors.green))),
                  );
                }).catchError((error) => Scaffold.of(_context).showSnackBar(
                      SnackBar(
                          content: Text("Somthing went wrong",
                              style: TextStyle(color: Colors.red))),
                    ));
              },
            ),
            FlatButton(
              child: Text(EnglishVer.NO,
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
