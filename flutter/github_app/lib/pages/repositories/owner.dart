import 'repo_model.dart';
import 'package:flutter/material.dart';

class Owner extends StatelessWidget {
  Owner(this.element);

  Repo element;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Login",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      )),
                  Text(""),
                  Text(element.login ?? "No login",
                      style: TextStyle(fontSize: 26, color: Colors.black54))
                ],
              ),
            ),
          ],
        )),
        Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Avatar URL",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      )),
                  Text(""),
                  Image(image: NetworkImage(element.avatar_url)),
                ],
              ),
            ),
          ],
        )),
        Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("ID",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      )),
                  Text(""),
                  Text("${element.id}",
                      style: TextStyle(fontSize: 26, color: Colors.black54))
                ],
              ),
            ),
          ],
        )),
        Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Node ID",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      )),
                  Text(""),
                  Text(element.node_id ?? "No Node ID",
                      style: TextStyle(fontSize: 26, color: Colors.black54))
                ],
              ),
            ),
          ],
        )),
        Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("User URL",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      )),
                  Text(""),
                  Text('${element.url}',
                      style: TextStyle(fontSize: 26, color: Colors.black54))
                ],
              ),
            ),
          ],
        )),
      ],
    );
  }
}
