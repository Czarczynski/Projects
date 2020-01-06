import 'repo_model.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About(this.element);

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
                      Text("Name",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text(element.name,
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Description",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text(element.description ?? "No description",
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Stars",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text('${element.star}',
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Watchers",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text('${element.watchers}',
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Size",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text('${element.size}',
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Branch",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text(element.default_branch,
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Opened Issues",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text("${element.open_issues_count}",
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
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
                      Text("Private",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text("${element.private}",
                          style: TextStyle(
                              fontSize: 26, color: Colors.black54))
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
