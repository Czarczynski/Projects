import 'dart:convert';

import 'package:flutter/material.dart';
import 'repo_model.dart';
import 'content_model.dart';
import 'package:provider/provider.dart';

class RepositoriesContent extends StatelessWidget {
  RepositoriesContent(this.item, this.element);

  final Repo element;
  final FetchContent item;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlocContent>(
        create: (context) =>
            BlocContent('/repos/${element.path}/contents/${item.path}'),
        child: Scaffold(
            appBar: AppBar(
              title: Text("${item.path}"),
            ),
            body: Scrollbar(child: _RepositoriesContentState(item, element))));
  }
}

class _RepositoriesContentState extends StatelessWidget {
  _RepositoriesContentState(this.item, this.element);

  final Repo element;
  final FetchContent item;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, BlocContent bloc, child) {
      if (item.type == "file") {
        String file;
        if (bloc.file == null) {
          bloc.readFile('/repos/${element.path}/contents/${item.path}');
          return Center(child: CircularProgressIndicator());
        }
        file = bloc.file.content;
        return ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(utf8.decode(base64.decode(file.replaceAll("\n", "")))),
          )
        ]);
      } else {
        var snapshot = bloc.items;
        if(snapshot.isEmpty)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, int index) {
            var item = snapshot[index];
            return GestureDetector(
              onTap: () => bloc.insideTree(context, item, element),
              child: Card(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                            "${(item.type == 'file') ? item.name : item.name + "/"}",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(item.download,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            );
          },
        );
      }
    });
  }
}
