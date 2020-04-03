import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/profile_page.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: DarkThemeConfig.WHITE,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/drawerbackground.jpeg'))),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .display2
                                          .copyWith(color: Colors.white),
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
                          child:
                              Icon(Icons.settings, size: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
            StreamBuilder(
                stream: profilePageBloc.streamControllerProfileInfo,
                builder: (context, snapshot) {
                  return Expanded(
                      child: Container(
                          color: DarkThemeConfig.WHITE_SMOKE,
                          child: !snapshot.hasData
                              ? Center(
                                  child: CircularProgressIndicator())
                              : ListView(
                                  padding: EdgeInsets.only(top: 0),
                                  children: <Widget>[
                                    _singleListTile(context, 0,
                                        icon: Icons.airplay,
                                        text: EnglishVer.DASHBOARD,
                                        route: DashboardPage()),
                                    _singleListTile(context, 1,
                                        icon: Icons.restaurant,
                                        text: EnglishVer.RECIPES,
                                        route: RecipesPage(cuisine: Lists.cuisines[0], diet: Lists.diets[0])),
                                    _singleListTile(context, 3,
                                        icon: Icons.history,
                                        text: EnglishVer.HISTORY,
                                        route: HistoryPage(profilePageBloc
                                            .profileInfo.lastVisited)),
                                    _singleListTile(context, 2,
                                        icon: Icons.star,
                                        text: EnglishVer.STARRED,
                                        route: StarredPage(
                                            profilePageBloc.profileInfo.starred))
                                  ],
                                )));
//                if (!snapshot.hasData){
//                  return ;}
//                else{
//                  return
//    ;}
                })
          ],
        ),
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
              ? DarkThemeConfig.WHITE
              : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                      index == 1
                  ? DarkThemeConfig.WHITE
                  : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                          index == 3
                      ? DarkThemeConfig.WHITE
                      : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                              index == 2
                          ? DarkThemeConfig.WHITE
                          : DarkThemeConfig.WHITE_SMOKE),
      child: ListTile(
        leading: Icon(icon,
            color: _currentDrawerPage == CurrentDrawerPage.DASHBOARD_PAGE &&
                    index == 0
                ? DarkThemeConfig.PURPLE_
                : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                        index == 1
                    ? DarkThemeConfig.PURPLE_
                    : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                            index == 3
                        ? DarkThemeConfig.PURPLE_
                        : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                                index == 2
                            ? DarkThemeConfig.PURPLE_
                            : DarkThemeConfig.BLUE_GRAY),
        title: Text('$text',
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: DarkThemeConfig.BLUE_GRANADE, fontSize: 14)),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => route));
        },
      ),
    );
  }
}
