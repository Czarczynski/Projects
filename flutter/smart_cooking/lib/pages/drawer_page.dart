import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/pages/profile_page.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/recipes_page.dart';
import 'package:smart_cooking/pages/starred_page.dart';

enum CurrentDrawerPage {
  DASHBOARD_PAGE,
  PROFILE_PAGE,
  RECIPES_PAGE,
  HISTORY_PAGE,
  SAVED_PAGE
}

class DrawerPage extends StatelessWidget {
  DrawerPage(this._currentDrawerPage);

  final CurrentDrawerPage _currentDrawerPage;

  UserBloc get profilePageBloc => UserBloc.internal();

  @override
  Widget build(BuildContext context) {
    profilePageBloc.fetchData();
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                      image:
                          AssetImage('assets/images/drawerbackground.jpeg'))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.person_pin_circle,
                          size: 70, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: StreamBuilder(
                            stream: profilePageBloc.streamControllerProfileInfo,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Center();
                              else
                                return Text(
                                    '${UserBloc.internal().profileInfo != null ? snapshot.data.firstName : "Antoni Kowalski"}',
                                    style: Theme.of(context).textTheme.display2,
                                    textAlign: TextAlign.center);
                            }),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfilePage(UserBloc.internal())));
                        },
                        child: Icon(Icons.settings,
                            size: 30, color: ThemeConfig.WHITE_SMOKE),
                      ),
                    ],
                  ),
                ],
              )),
          StreamBuilder(
              stream: profilePageBloc.streamControllerProfileInfo,
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  );}
                else{
                  return Expanded(
                    child: Container(
                      color: ThemeConfig.SNOW,
                      child: ListView(
                        padding: EdgeInsets.only(top: 0),
                        children: <Widget>[
                          _singleListTile(context, 0,
                              icon: Icons.airplay,
                              text: EngStrings.DASHBOARD,
                              route: DashboardPage()),
                          _singleListTile(context, 1,
                              icon: Icons.restaurant,
                              text: EngStrings.RECIPES,
                              route: RecipesPage()),
                          _singleListTile(context, 3,
                              icon: Icons.history,
                              text: EngStrings.HISTORY,
                              route: HistoryPage(
                                  profilePageBloc.profileInfo.lastVisited)),
                          _singleListTile(context, 2,
                              icon: Icons.star,
                              text: EngStrings.STARRED,
                              route: StarredPage(
                                  profilePageBloc.profileInfo.starred))
                        ],
                      ),
                    ),
                  );}
              })
        ],
      ),
    );
  }

  Container _singleListTile(BuildContext context, int index,
      {IconData icon = Icons.file_download,
      String text = '',
      StatelessWidget route}) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _currentDrawerPage == CurrentDrawerPage.DASHBOARD_PAGE &&
                  index == 0
              ? ThemeConfig.WHITE_SMOKE
              : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                      index == 1
                  ? ThemeConfig.WHITE_SMOKE
                  : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                          index == 3
                      ? ThemeConfig.WHITE_SMOKE
                      : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                              index == 2
                          ? ThemeConfig.WHITE_SMOKE
                          : ThemeConfig.SNOW),
      child: ListTile(
        leading: Icon(icon,
            color: _currentDrawerPage == CurrentDrawerPage.DASHBOARD_PAGE &&
                    index == 0
                ? Color.fromRGBO(65, 81, 253, 1)
                : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                        index == 1
                    ? Color.fromRGBO(65, 81, 253, 1)
                    : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                            index == 3
                        ? Color.fromRGBO(65, 81, 253, 1)
                        : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                                index == 2
                            ? Color.fromRGBO(65, 81, 253, 1)
                            : ThemeConfig.BLUE_GRAY),
        title: Text('$text',
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: ThemeConfig.BLUE_GRANADE, fontSize: 14)),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => route));
        },
      ),
    );
  }
}
