import 'commit_model.dart';
import 'package:flutter/material.dart';
import 'repo_model.dart';
import 'package:provider/provider.dart';

class Commits extends StatelessWidget {
  Commits(this.element);

  Repo element;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlocCommits>(
        create: (context) => BlocCommits('repos/${element.path}/commits'),
        child: _CommitsState(element));
  }
}

class _CommitsState extends StatelessWidget {
  _CommitsState(this.element);

  Repo element;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, BlocCommits bloc, child) {
      List<FetchCommits> snapshot = bloc.items;
      if (snapshot.isEmpty) return Center(child: CircularProgressIndicator());
      return ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, int index) {
            var itemCommit = snapshot[index];
            return Card(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("#${index + 1}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          )),
                      Text(""),
                      Text('${itemCommit.message}',
                          maxLines: null,
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                      Text(""),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Text("Author: "),
                            Text('${itemCommit.author}',
                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black54)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          });
    });
  }
}
