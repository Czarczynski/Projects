import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
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
  String chosenType = 'all';

  @override
  Widget build(BuildContext context) {
    profilePageBloc.fetchData();
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).backgroundColor),
        Image(
          image: AssetImage("assets/images/food_img.png"),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          color: Colors.grey,
          colorBlendMode: BlendMode.lighten,
        ),
        Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Container(
                  height: 26,
                  width: 204,
                  child: Text(EnglishVer.DASHBOARD,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: LightThemeConfig.BLUE_GRAY))),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  icon: Icon(Icons.toc),
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                  onPressed: () => _scaffoldKey.currentState.openDrawer()),
            ),
            drawer: DrawerPage(CurrentDrawerPage.DASHBOARD_PAGE),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _text(context, EnglishVer.YOUR_LISTS),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryPage(
                                        UserBloc.internal()
                                            .profileInfo
                                            .lastVisited))),
                            child: _button(
                              context,
                              EnglishVer.HISTORY,
                              width: 0.45,
                              marginright: 0,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StarredPage(
                                        UserBloc.internal().profileInfo.starred))),
                            child: _button(
                              context,
                              EnglishVer.STARRED,
                              width: 0.45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.5 +20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipesPage(
                                      cuisine: chosenCuisine,
                                      diet: chosenDiet,
                                      type: chosenType))),
                          child: _button(context, EnglishVer.SHOW_RECIPES),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.filter_list,
                                    color: Theme.of(context).textTheme.title.color,
                                    size: 25,
                                  ),
                                  Text(
                                    "Filters",
                                    style: TextStyle(
                                        color:
                                        Theme.of(context).textTheme.title.color,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.03,
                              vertical: 15),
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Type",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .appBarTheme
                                              .textTheme
                                              .title
                                              .color)),
                                  RaisedButton(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      onPressed: () => Picker(
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                          itemExtent: 40,
                                          textStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .textTheme
                                                  .title
                                                  .color,
                                              fontSize: 30),
                                          selectedTextStyle:
                                          TextStyle(fontSize: 33),
                                          confirmTextStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .title
                                                  .color),
                                          containerColor:
                                          Theme.of(context).backgroundColor,
                                          backgroundColor:
                                          Theme.of(context).backgroundColor,
                                          headercolor:
                                          Theme.of(context).backgroundColor,
                                          adapter: PickerDataAdapter<String>(
                                              pickerdata: Lists.types),
                                          changeToFirst: false,
                                          textAlign: TextAlign.center,
                                          columnPadding:
                                          const EdgeInsets.all(8.0),
                                          onConfirm: (Picker picker, List value) {
                                            chosenType =
                                                picker.getSelectedValues().first;
                                            setState(() {});
                                          }).show(_scaffoldKey.currentState),
                                      child: _myRow(context, chosenType)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Cuisine",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .appBarTheme
                                                    .textTheme
                                                    .title
                                                    .color)),
                                        RaisedButton(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            onPressed: () => Picker(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.3,
                                                itemExtent: 40,
                                                textStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .appBarTheme
                                                        .textTheme
                                                        .title
                                                        .color,
                                                    fontSize: 30),
                                                selectedTextStyle:
                                                TextStyle(fontSize: 33),
                                                confirmTextStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .title
                                                        .color),
                                                containerColor: Theme.of(context)
                                                    .backgroundColor,
                                                backgroundColor: Theme.of(context)
                                                    .backgroundColor,
                                                headercolor: Theme.of(context)
                                                    .backgroundColor,
                                                adapter: PickerDataAdapter<String>(
                                                    pickerdata: Lists.cuisines),
                                                changeToFirst: false,
                                                textAlign: TextAlign.center,
                                                columnPadding:
                                                const EdgeInsets.all(8.0),
                                                onConfirm:
                                                    (Picker picker, List value) {
                                                  chosenCuisine = picker
                                                      .getSelectedValues()
                                                      .first;
                                                  setState(() {});
                                                }).show(_scaffoldKey.currentState),
                                            child: _myRow(context, chosenCuisine)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Diet",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .title
                                                    .color)),
                                        RaisedButton(
                                            elevation: 0,
                                            color: Colors.transparent,
                                            onPressed: () => Picker(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.3,
                                                itemExtent: 40,
                                                textStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .title
                                                        .color,
                                                    fontSize: 30),
                                                selectedTextStyle:
                                                TextStyle(fontSize: 33),
                                                confirmTextStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .title
                                                        .color),
                                                containerColor: Theme.of(context)
                                                    .backgroundColor,
                                                backgroundColor: Theme.of(context)
                                                    .backgroundColor,
                                                headercolor: Theme.of(context)
                                                    .backgroundColor,
                                                adapter: PickerDataAdapter<String>(
                                                    pickerdata: Lists.diets),
                                                changeToFirst: true,
                                                textAlign: TextAlign.center,
                                                columnPadding:
                                                const EdgeInsets.all(8.0),
                                                onConfirm:
                                                    (Picker picker, List value) {
                                                  chosenDiet = picker
                                                      .getSelectedValues()
                                                      .first;
                                                  setState(() {});
                                                }).show(_scaffoldKey.currentState),
                                            child: _myRow(context, chosenDiet)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Container _button(_context, String _text,
      {width = 1, double marginleft = 0.03, double marginright = 0.03}) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(_context).size.width * marginleft,
          0,
          MediaQuery.of(_context).size.width * marginright,
          16),
      width: MediaQuery.of(_context).size.width * width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black,
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -14)
        ],
        color:  Theme.of(context).textTheme.display2.color,
        borderRadius: BorderRadius.all(Radius.circular(8)),
//          border: Border.all(width: 1, color: Theme.of(context).textTheme.title.color)
      ),
      child: Center(
        child: Text(
          _text,
          style: Theme.of(_context).textTheme.display2.copyWith(
              color: Theme.of(context).textTheme.title.color,
              fontWeight: FontWeight.w500),
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
            .copyWith(color: LightThemeConfig.BLUE_GRAY, fontSize: 16),
        maxLines: 1,
      ),
    );
  }
}

Container _myRow(BuildContext _context, String _chosen) {
  return Container(decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            width: 1, color: Theme.of(_context).textTheme.subhead.color),
      )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(_chosen,
              style:
                  TextStyle(color: Theme.of(_context).textTheme.title.color)),
        ),
        Icon(Icons.keyboard_arrow_down,
            color: Theme.of(_context).textTheme.title.color)
      ],
    ),
  );
}
