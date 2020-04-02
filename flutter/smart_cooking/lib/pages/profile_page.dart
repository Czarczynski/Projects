import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';

import 'drawer_page.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfilePage(this._profilePageBloc);

  final UserBloc _profilePageBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(CurrentDrawerPage.PROFILE_PAGE),
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
              height: 26,
              width: 204,
              child: Text(EnglishVer.PROFILE,
                  style: Theme.of(context).textTheme.title)),
        ),
        leading: IconButton(
            icon: Icon(Icons.toc),
            color: DarkThemeConfig.PURPLE_,
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: <Widget>[
                _profilePagePhoto(context),
                Expanded(child: _profilePageDetails(context))
              ],
            );
          } else {
            return Row(
              children: <Widget>[
                _profilePagePhoto(context,
                    height: 1, width: 0.5, photoheight: 0.6, photowidth: 0.6),
                _profilePageDetails(context, height: 1, width: 0.5)
              ],
            );
          }
        },
      ),
    );
  }

  Container _profilePagePhoto(BuildContext context,
      {double height = 0.52,
      double width = 1,
      double photoheight = 0.324,
      double photowidth = 0.324}) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(color: DarkThemeConfig.WHITE_SMOKE),
      child: Center(
          child: Container(
        width: MediaQuery.of(context).size.height * photoheight,
        height: MediaQuery.of(context).size.height * photowidth,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: DarkThemeConfig.WHITE,
                blurRadius: 1000,
                offset: Offset(0, 2))
          ],
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/face.png"),
          ),
        ),
      )),
    );
  }
  DateTime _creationDate = DateTime.parse(UserBloc.internal().profileInfo.creationDate);
  Container _profilePageDetails(BuildContext context,
      {double height = 1, double width = 1}) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(color: DarkThemeConfig.WHITE_SMOKE),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: 32,
              child: StreamBuilder(
                  stream: UserBloc.internal().streamControllerProfileInfo,
                  builder: (context, snapshot) {
                    return Text(
                        '${_profilePageBloc.profileInfo != null ?
                        UserBloc.internal().profileInfo.userName : "Default String"}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .display2
                            .copyWith(color: DarkThemeConfig.BLUE_GRAY));
                  })),
          Expanded(
//            margin: EdgeInsets.fromLTRB(8, 0, 8, 32),
//            height: 58,
            child: ListView(
              children: <Widget>[
                Text('${EnglishVer.PROFILE}\n\n',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: DarkThemeConfig.BLUE_LIGHT_GRAY)),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, left: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${EnglishVer.FIRSTNAME}:\n\n'
                            '${EnglishVer.LASTNAME}:\n\n'
                            '${EnglishVer.PHONE_NO}:\n\n'
                            '${EnglishVer.TIME_WITH_US}:\n\n',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: DarkThemeConfig.PURPLE_),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 1.0, left: 20),
                            child: Text(
                                '${UserBloc.internal().profileInfo.firstName}\n\n'
                                '${UserBloc.internal().profileInfo.lastName}\n\n'
                                '${UserBloc.internal().profileInfo.phoneNumber}\n\n'
                                '${_creationDate.year} ${monthInWord(_creationDate.month)} ${_creationDate.day}\n\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(color: DarkThemeConfig.BLUE_GRAY))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String monthInWord(int _switcher){
    switch(_switcher){
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown Month";
    }
  }
}
