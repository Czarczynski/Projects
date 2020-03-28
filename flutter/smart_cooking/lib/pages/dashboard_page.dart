import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/history_list.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';
import 'package:smart_cooking/pages/recipes_page.dart';
import 'package:smart_cooking/pages/starred_page.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UserBloc get profilePageBloc => UserBloc.internal();

  @override
  Widget build(BuildContext context) {
    profilePageBloc.fetchData();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
              height: 26,
              width: 204,
              child: Text(EngStrings.DASHBOARD,
                  style: Theme.of(context).textTheme.title)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: LogoutButton(),
            )
          ],
          leading: IconButton(
              icon: Icon(Icons.toc),
              color: ThemeConfig.PURPLE_,
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        drawer: DrawerPage(CurrentDrawerPage.DASHBOARD_PAGE),
        body: ChangeNotifierProvider<RecipesBloc>(
            create: (context) => RecipesBloc(_scaffoldKey.currentContext),
            child:
                Consumer<RecipesBloc>(builder: (context, RecipesBloc _bloc, _) {
              if (_bloc.isInProgress)
                return Center(child: CircularProgressIndicator());
              return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Visibility(
                        child: InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipesPage())),
                          child: _button(
                            context,
                            EngStrings.RANDOM_RECIPES,
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF7472af), Color(0xFF403e77)]),
                          ),
                        ),
                      );
                    } else if (index == 1) {
                      return _text(context, EngStrings.ACTIONS);
                    } else if (index == 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoryPage(UserBloc.internal().profileInfo.lastVisited))),
                            child: _button(
                              context,
                              EngStrings.STARRED,
                              null,
                              width: 0.45,
                              marginright: 0,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StarredPage(UserBloc.internal().profileInfo.starred))),
                            child: _button(
                              context,
                              EngStrings.HISTORY,
                              LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF7472af),
                                    Color(0xFF403e77)
                                  ]),
                              width: 0.45,
                            ),
                          ),
                        ],
                      );
                    } else if (index == 3) {
                      return _text(context, EngStrings.LAST_VISITED);
                    } else {
                      if (_bloc.recipeModels.length > 0) {
                        return RecipeCard(_bloc.recipeModels[index - 4], '');

                      } else {
                        return NoResults();
                      }
                    }
                  });
            })));
  }

  Container _button(_context, String _text, LinearGradient _gradient,
      {width = 1, double marginleft = 12, double marginright = 12}) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(marginleft, 12, marginright, 16),
      width: MediaQuery.of(_context).size.width * width,
      decoration: BoxDecoration(
        color: ThemeConfig.VENETIAN_RED,
        gradient: _gradient,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          _text,
          style: Theme.of(_context)
              .textTheme
              .display2
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Padding _text(_context, _text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        _text,
        style: Theme.of(_context)
            .textTheme
            .display3
            .copyWith(color: Colors.black54, fontSize: 16),
        maxLines: 1,
      ),
    );
  }
}
