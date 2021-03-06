import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/common/theme_changer.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/profile_page.dart';
import 'package:smart_cooking/pages/recipes_page.dart';
import 'package:smart_cooking/pages/starred_page.dart';

import '../theme.dart';

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

  void _changeTheme(BuildContext _context) {
    if (ThemeChanger.instanceOf(_context).theme == CustomThemes.darkTheme)
      ThemeChanger.instanceOf(_context).changeTheme(ThemeKey.LIGHT);
    else
      ThemeChanger.instanceOf(_context).changeTheme(ThemeKey.DARK);
  }

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
                    color: Theme.of(context).textTheme.display2.color,
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
                            size: 70,
                            color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: StreamBuilder(
                              stream:
                                  profilePageBloc.streamControllerProfileInfo,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Center();
                                else
                                  return Text(
                                      '${UserBloc.internal().profileInfo != null ? snapshot.data.firstName : "Example"}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .display2
                                          .copyWith(
                                              color: Colors.white),
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
                              size: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: StreamBuilder(
                    stream: profilePageBloc.streamControllerProfileInfo,
                    builder: (context, snapshot) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                              flex: 5,
                              child: !snapshot.hasData
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        children: <Widget>[
                                          _singleListTile(context, 0,
                                              icon: Icons.airplay,
                                              text: EnglishVer.HOME,
                                              route: DashboardPage()),
                                          _singleListTile(context, 1,
                                              icon: Icons.restaurant,
                                              text: EnglishVer.RECIPES,
                                              route: RecipesPage(
                                                cuisine: Lists.cuisines[0],
                                                diet: Lists.diets[0],
                                                type: Lists.diets[0],
                                              )),
                                          _singleListTile(context, 3,
                                              icon: Icons.history,
                                              text: EnglishVer.HISTORY,
                                              route: HistoryPage(profilePageBloc
                                                  .profileInfo.lastVisited)),
                                          _singleListTile(context, 2,
                                              icon: Icons.star,
                                              text: EnglishVer.STARRED,
                                              route: StarredPage(profilePageBloc
                                                  .profileInfo.starred))
                                        ],
                                      ),
                                    )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Dark Mode",
                                            style: TextStyle(fontSize: 14)),
                                        Switch(
                                          value:
                                              ThemeChanger.instanceOf(context)
                                                      .theme ==
                                                  CustomThemes.darkTheme,
                                          onChanged: (value) {
                                            _changeTheme(context);
                                          },
                                          activeTrackColor: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .color,
                                          activeColor:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Theme.of(context).buttonColor),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Log out",
                                            style: TextStyle(fontSize: 14)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: LogoutButton(),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            )
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
              ? Theme.of(context).textTheme.display2.color
              : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                      index == 1
                  ? Theme.of(context).textTheme.display2.color
                  : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                          index == 3
                      ? Theme.of(context).textTheme.display2.color
                      : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                              index == 2
                          ? Theme.of(context).textTheme.display2.color
                          : Theme.of(context).backgroundColor),
      child: ListTile(
        leading: Icon(icon,
            color: _currentDrawerPage == CurrentDrawerPage.DASHBOARD_PAGE &&
                    index == 0
                ? Theme.of(context).appBarTheme.iconTheme.color
                : _currentDrawerPage == CurrentDrawerPage.RECIPES_PAGE &&
                        index == 1
                    ? Theme.of(context).appBarTheme.iconTheme.color
                    : _currentDrawerPage == CurrentDrawerPage.HISTORY_PAGE &&
                            index == 3
                        ? Theme.of(context).appBarTheme.iconTheme.color
                        : _currentDrawerPage == CurrentDrawerPage.SAVED_PAGE &&
                                index == 2
                            ? Theme.of(context).appBarTheme.iconTheme.color
                            : Theme.of(context).textTheme.title.color),
        title: Text('$text',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.display1.copyWith(
                color: Theme.of(context).textTheme.body1.color, fontSize: 14)),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => route));
        },
      ),
    );
  }
}
