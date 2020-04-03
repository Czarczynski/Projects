import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';
import 'package:smart_cooking/pages/recipes_page.dart';
import 'package:smart_cooking/pages/starred_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashboardPage();
  }
}

// ignore: must_be_immutable
class _DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<_DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserBloc get profilePageBloc => UserBloc.internal();

  bool showFilter = false;
  String chosenCuisine = 'all';
  String chosenDiet = 'all';

  @override
  Widget build(BuildContext context) {
    profilePageBloc.fetchData();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Container(
              height: 26,
              width: 204,
              child: Text(EnglishVer.DASHBOARD,
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
              color: DarkThemeConfig.PURPLE_,
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        drawer: DrawerPage(CurrentDrawerPage.DASHBOARD_PAGE),
        body: ChangeNotifierProvider<RecipesResultBloc>(
            create: (context) => RecipesResultBloc(_scaffoldKey.currentContext,chosenCuisine, chosenDiet),
            child: Consumer<RecipesResultBloc>(
                builder: (context, RecipesResultBloc _bloc, _) {
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
                                  builder: (context) => RecipesPage(cuisine: chosenCuisine, diet: chosenDiet,))),
                          child: _button(
                            context,
                            EnglishVer.RANDOM_RECIPES,
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  DarkThemeConfig.VIOLENT_START,
                                  DarkThemeConfig.VIOLENT_END
                                ]),
                          ),
                        ),
                      );
                    } else if (index == 1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: RaisedButton(
                                color: DarkThemeConfig.WHITE_SMOKE,
                                onPressed: () {
                                  showFilter = !showFilter;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.filter_list,
                                        color: DarkThemeConfig.BLUE_GRAY,
                                      ),
                                      Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: DarkThemeConfig.BLUE_GRAY),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: AnimatedContainer(
                              height: showFilter ? 100 : 0,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 500),
                              child: ListView(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Cuisine",
                                              style: TextStyle(
                                                  color: DarkThemeConfig
                                                      .BLUE_GRAY)),
                                          RaisedButton(
                                            elevation: 0,
                                            color: DarkThemeConfig.WHITE_SMOKE,
                                            onPressed: () => Picker(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                itemExtent: 40,
                                                textStyle: TextStyle(
                                                    color: DarkThemeConfig
                                                        .BLUE_GRAY,
                                                    fontSize: 30),
                                                selectedTextStyle:
                                                    TextStyle(fontSize: 33),
                                                confirmTextStyle: TextStyle(
                                                    color: DarkThemeConfig
                                                        .BLUE_GRAY),
                                                containerColor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                backgroundColor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                headercolor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                adapter:
                                                    PickerDataAdapter<String>(
                                                        pickerdata:
                                                            Lists.cuisines),
                                                changeToFirst: false,
                                                textAlign: TextAlign.center,
                                                columnPadding:
                                                    const EdgeInsets.all(8.0),
                                                onConfirm: (Picker picker,
                                                    List value) {
                                                  chosenCuisine = picker
                                                      .getSelectedValues()
                                                      .first;
                                                  setState(() {});
                                                }).show(_scaffoldKey.currentState),
                                            child: _myRow(context, chosenCuisine)
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Diet",
                                              style: TextStyle(
                                                  color: DarkThemeConfig
                                                      .BLUE_GRAY)),
                                          RaisedButton(
                                            elevation: 0,
                                            color: DarkThemeConfig.WHITE_SMOKE,
                                            onPressed: () => Picker(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                itemExtent: 40,
                                                textStyle: TextStyle(
                                                    color: DarkThemeConfig
                                                        .BLUE_GRAY,
                                                    fontSize: 30),
                                                selectedTextStyle:
                                                    TextStyle(fontSize: 33),
                                                confirmTextStyle: TextStyle(
                                                    color: DarkThemeConfig
                                                        .BLUE_GRAY),
                                                containerColor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                backgroundColor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                headercolor:
                                                    DarkThemeConfig.WHITE_SMOKE,
                                                adapter:
                                                    PickerDataAdapter<String>(
                                                        pickerdata:
                                                            Lists.diets),
                                                changeToFirst: true,
                                                textAlign: TextAlign.center,
                                                columnPadding:
                                                    const EdgeInsets.all(8.0),
                                                onConfirm: (Picker picker,
                                                    List value) {
                                                  chosenDiet = picker
                                                      .getSelectedValues()
                                                      .first;
                                                  setState(() {});
                                                }).show(_scaffoldKey.currentState),
                                            child: _myRow(context, chosenDiet)
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _text(context, EnglishVer.ACTIONS)
                        ],
                      );
                    } else if (index == 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryPage(
                                        UserBloc.internal()
                                            .profileInfo
                                            .lastVisited))),
                            child: _button(
                              context,
                              EnglishVer.HISTORY,
                              null,
                              width: 0.45,
                              marginright: 0,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StarredPage(
                                        UserBloc.internal()
                                            .profileInfo
                                            .starred))),
                            child: _button(
                              context,
                              EnglishVer.STARRED,
                              LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    DarkThemeConfig.VIOLENT_START,
                                    DarkThemeConfig.VIOLENT_END
                                  ]),
                              width: 0.45,
                            ),
                          ),
                        ],
                      );
                    } else if (index == 3) {
                      return _text(context, EnglishVer.STARRED);
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
      {width = 1, double marginleft = 0.03, double marginright = 0.03}) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(_context).size.width * marginleft,
          12,
          MediaQuery.of(_context).size.width * marginright,
          16),
      width: MediaQuery.of(_context).size.width * width,
      decoration: BoxDecoration(
        color: DarkThemeConfig.VENETIAN_RED,
        gradient: _gradient,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          _text,
          style: Theme.of(_context).textTheme.display2.copyWith(
              color: DarkThemeConfig.WHITE, fontWeight: FontWeight.w500),
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
            .copyWith(color: DarkThemeConfig.BLACK, fontSize: 16),
        maxLines: 1,
      ),
    );
  }
}


Row _myRow(BuildContext _context, String _chosen){
  return Row(
    children: <Widget>[
      Container(
        width: MediaQuery.of(_context)
            .size
            .width *
            0.3,
        padding:
        const EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 5),
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: 1,
                  color: DarkThemeConfig
                      .BLACK),
              top: BorderSide(
                  width: 1,
                  color: DarkThemeConfig
                      .BLACK),
              bottom: BorderSide(
                  width: 1,
                  color: DarkThemeConfig
                      .BLACK),
            )),
        child: SingleChildScrollView(
          scrollDirection:
          Axis.horizontal,
          child: Text(_chosen,
              style: TextStyle(
                  color:
                  DarkThemeConfig
                      .BLUE_GRAY)),
        ),
      ),
      Container(
        padding:
        const EdgeInsets.only(
            top: 6,
            bottom: 6,
            right: 5),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 1,
                    color:
                    DarkThemeConfig
                        .BLACK),
                bottom: BorderSide(
                    width: 1,
                    color:
                    DarkThemeConfig
                        .BLACK),
                right: BorderSide(
                    width: 1,
                    color:
                    DarkThemeConfig
                        .BLACK))),
        child: Icon(
            Icons
                .arrow_drop_down_circle,
            color: DarkThemeConfig
                .BLUE_GRAY),
      )
    ],
  );
}
