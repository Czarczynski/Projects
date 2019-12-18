import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/ProfilePageBloc.dart';
import 'package:smart_cooking/pages/ProfilePage.dart';
import 'package:smart_cooking/pages/dashboard_page.dart';
import 'package:smart_cooking/pages/guidebook_page.dart';
import 'package:smart_cooking/pages/history_page.dart';
import 'package:smart_cooking/pages/projects_page.dart';
import 'package:smart_cooking/pages/rooms_page.dart';
import 'package:flutter/material.dart';

enum CurrentDrawerPage {
  DASHBOARD_PAGE,
  PROFILE_PAGE,
  PROJECTS_PAGE,
  GUIDEBOOK_PAGE,
  ROOMS_PAGE,
  DEVICES
}

class DrawerPage extends StatelessWidget {
  DrawerPage(this._currentDrawerPage);

  final CurrentDrawerPage _currentDrawerPage;

  ProfilePageBloc get profilePageBloc => ProfilePageBloc.internal();

  @override
  Widget build(BuildContext context) {
    profilePageBloc.fetchData();
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/drawerbackground.jpeg'))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StreamBuilder(
                        stream: profilePageBloc.streamControllerProfileInfo,
                        builder: (context, snapshot) {
                          return Icon(Icons.person_pin_circle,
                              size: 70, color: Colors.white);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: StreamBuilder(
                            stream: profilePageBloc.streamControllerProfileInfo,
                            builder: (context, snapshot) {
                              return Text(
                                  '${ProfilePageBloc.internal().profileInfo != null ? ProfilePageBloc.internal().profileInfo.name : "Antoni Kowalski"}',
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
                                      ProfilePage(ProfilePageBloc.internal())));
                        },
                        child: Icon(Icons.settings,
                            size: 30, color: ThemeConfig.WHITE_SMOKE),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
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
                      text: EngStrings.PROJECTS,
                      route: ProjectsPage()),
                  _singleListTile(context, 3,
                      icon: Icons.history,
                      text: EngStrings.ROOMS,
                      route: HistoryPage())
                ],
              ),
            ),
          ),
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
              : _currentDrawerPage == CurrentDrawerPage.PROJECTS_PAGE &&
                      index == 1
                  ? ThemeConfig.WHITE_SMOKE
                  : _currentDrawerPage == CurrentDrawerPage.GUIDEBOOK_PAGE &&
                          index == 3
                      ? ThemeConfig.WHITE_SMOKE
                      : _currentDrawerPage == CurrentDrawerPage.ROOMS_PAGE &&
                              index == 2
                          ? ThemeConfig.WHITE_SMOKE
                          : ThemeConfig.SNOW),
      child: ListTile(
        leading: Icon(icon,
            color: _currentDrawerPage == CurrentDrawerPage.DASHBOARD_PAGE &&
                    index == 0
                ? Color.fromRGBO(65, 81, 253, 1)
                : _currentDrawerPage == CurrentDrawerPage.PROJECTS_PAGE &&
                        index == 1
                    ? Color.fromRGBO(65, 81, 253, 1)
                    : _currentDrawerPage == CurrentDrawerPage.GUIDEBOOK_PAGE &&
                            index == 3
                        ? Color.fromRGBO(65, 81, 253, 1)
                        : _currentDrawerPage == CurrentDrawerPage.ROOMS_PAGE &&
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
