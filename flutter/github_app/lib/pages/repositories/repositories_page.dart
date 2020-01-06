import 'package:github_app/api/github_http_client.dart';
import 'package:github_app/store/account_manager.dart';
import 'package:flutter/material.dart';
import 'package:github_app/pages/login/login_page.dart';
import 'repositories_subpage.dart';
import 'repo_model.dart';
import 'package:provider/provider.dart';

class RepositoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlocRepo>(
      create: (context) => BlocRepo(),
      child: Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Repositories", style: TextStyle(letterSpacing: 3.0))),
            actions: <Widget>[
              Consumer<BlocRepo>(builder: (context, bloc, child) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: IconButton(
                        tooltip:
                            "Make long press on the repository to add to favourites",
                        onPressed: () {
                          Provider.of<BlocRepo>(context, listen: false)
                              .changeMode();
                        },
                        icon: Icon(
                            (bloc.like == 1)
                                ? Icons.all_inclusive
                                : (bloc.like == 3)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                            color: Colors.red),
                      ),
                    ),
                    RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          Provider.of<BlocRepo>(context, listen: false)
                              .logOut(context);
                        },
                        child: Text('Log out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ],
                );
              }),
            ],
          ),
          body: _RepositoriesPageState(),
          bottomNavigationBar:
              Consumer<BlocRepo>(builder: (context, bloc, child) {
            return BottomAppBar(
              color: Colors.white,
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                  (bloc.mode == Mode.all)
                      ? "All"
                      : (bloc.mode == Mode.liked)
                          ? "Liked"
                          : "Other",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.blue)),
            ));
          })),
    );
  }
}

class _RepositoriesPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BlocRepo bloc, child) {
        if (bloc.isInProgress())
          return Center(child: CircularProgressIndicator());
        if (bloc.getModels().isEmpty)
          return Center(
              child: Text("No repositories to show",
                  style: TextStyle(fontSize: 25)));
        return View(bloc.getModels());
      },
    );
  }
}

class View extends StatelessWidget {
  View(this.snapshot);

  final List<Repo> snapshot;

  @override
  Widget build(BuildContext context) {
    BlocRepo bloc = Provider.of<BlocRepo>(context, listen: false);
    return ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: (context, int index) {
          Repo element = snapshot[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GestureDetector(
                onLongPress: () => bloc.changeLike(element),
                onTap: () {
                  Provider.of<BlocRepo>(context, listen: false)
                      .goInside(element, context);
                },
                child: Card(
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 15, right: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                    (element.like)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red),
                                Text(element.path,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                          ),
                          Text(""),
                          Text(element.description ?? "No description",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                          Text(""),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star),
                              Text('${element.star}')
                            ],
                          ),
                        ]),
                  ),
                )),
          );
        });
  }
}

enum Mode { all, liked, normal }

class BlocRepo extends ChangeNotifier {
  List<Repo> items = [];
  bool _isInProgress = true;

  BlocRepo() {
    fetchData().then((lista) {
      this.items = lista;
      notifyListeners();
    });
  }

  Mode mode = Mode.normal;

  Future<List<Repo>> fetchData() async {
    final response = await GithubHttpClient().get('user/repos');
    this._isInProgress = !_isInProgress;

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => Repo.fromJson(item))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  List<Repo> getModels() {
    switch (mode) {
      case Mode.all:
        return items;
      case Mode.liked:
        return items.where((m) => m.like).toList();
      case Mode.normal:
        return items.where((m) => !m.like).toList();
      default:
        return items;
    }
  }

  goInside(Repo element, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RepositoriesSubpage(element)));
    notifyListeners();
  }

  logOut(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    AccountManager().clear();
  }

  //int get countOfLikes => items.where((m) => m.like).toList().length;

//
  changeLike(Repo element) {
    element.changeLike();
    notifyListeners();
  }

  int like = 1;

  changeMode() {
    mode = mode == Mode.all
        ? Mode.liked
        : (mode == Mode.liked) ? Mode.normal : Mode.all;
    like = mode == Mode.normal ? 2 : (mode == Mode.liked) ? 3 : 1;
    notifyListeners();
  }

  bool isInProgress() => _isInProgress;
}
