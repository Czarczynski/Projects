import 'issues_model.dart';
import 'package:flutter/material.dart';
import 'repo_model.dart';
import 'package:provider/provider.dart';

class Issues extends StatelessWidget {
  Issues(this.element);

  final Repo element;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<BlocIssues>(
        create: (context) => BlocIssues('repos/${element.path}/issues'),
        child: _IssuesState(element));
  }
}

class _IssuesState extends StatelessWidget {
  _IssuesState(this.element);

  final Repo element;
  final _formKey = GlobalKey<FormState>();
  final controllerTitle = TextEditingController();
  final controllerComment = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerTitle.dispose();
    controllerComment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, BlocIssues bloc, child) {
      //BlocIssues bloc = Provider.of<BlocIssues>(context, listen: false);
      List<FetchIssues> snapshot;
      snapshot = bloc.items;

      if(snapshot.isEmpty)
        return Center(child: CircularProgressIndicator());
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, int index) {
                FetchIssues item = snapshot[index];
                return Card(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("#${item.number}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  )),
                              Text("    "),
                              Text('${item.title}',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black))
                            ],
                          ),
                          Text(""),
                          Text('${item.body}',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54)),
                          Text(""),
                          Text(item.state,
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 3.0,
                                  backgroundColor: (item.state == "open")
                                      ? Colors.lightGreen
                                      : Colors.redAccent))
                        ],
                      ),
                    ),
                  ],
                ));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                highlightElevation: 100,
                tooltip: "Create issue",
                child: Icon(Icons.add_circle_outline,
                    size: 58, color: Colors.blue),
                onPressed: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("New Issue"),
                            content: Container(
                              width: 300,
                              height: 303,
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextFormField(
                                          controller: controllerTitle,
                                          decoration:
                                              InputDecoration(hintText: 'Title'),
                                          validator: (title) {
                                            if (title.isEmpty) {
                                              return 'You left it empty!';
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          minLines: 1,
                                          maxLines: 5,
                                          controller: controllerComment,
                                          decoration: InputDecoration(
                                              hintText: 'Leave a comment'),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                16.0))),
                                                child: Text("Add",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                onPressed: () => bloc.send(
                                                    controllerTitle,
                                                    controllerComment,
                                                    _formKey,
                                                    element)))
                                      ])),
                            ));
                      });
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
