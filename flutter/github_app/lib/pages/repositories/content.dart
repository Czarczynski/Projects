import 'repo_model.dart';
import 'package:flutter/material.dart';
import 'content_model.dart';
import 'package:provider/provider.dart';
import 'repositories_content.dart';

class Content extends StatelessWidget {
  final Repo element;

  Content(this.element);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlocContent>(
        create: (context) => BlocContent('/repos/${element.path}/contents/'),
        child: Consumer(builder: (context, BlocContent bloc, child) {
          List<FetchContent> snapshot = bloc.items;
          if (snapshot.isEmpty)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, int index) {
                var item = snapshot[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RepositoriesContent(item, element)));
                  },
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
              });
        }) //_ContentState(element),
        );
  }
}

//class _ContentState extends StatelessWidget {
//  _ContentState(this.element);
//
//  Repo element;
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer(builder: (context3, BlocContent bloc, child) {
//      List<FetchContent> snapshot = bloc.items;
//      if (snapshot.isEmpty) return Center(child: CircularProgressIndicator());
//      return ListView.builder(
//          itemCount: snapshot.length,
//          itemBuilder: (context, int index) {
//            var item = snapshot[index];
//            return GestureDetector(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) =>
//                            RepositoriesContent(item, element)));
//              },
//              child: Card(
//                  child: Column(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: <Widget>[
//                        Text(
//                            "${(item.type == 'file') ? item.name : item.name + "/"}",
//                            style: TextStyle(
//                              fontSize: 22,
//                              color: Colors.blue,
//                            )),
//                        SingleChildScrollView(
//                          scrollDirection: Axis.horizontal,
//                          child: Text(item.download,
//                              style: TextStyle(
//                                  fontSize: 16, color: Colors.black54)),
//                        )
//                      ],
//                    ),
//                  ),
//                ],
//              )),
//            );
//          });
//    });
//  }
//}
