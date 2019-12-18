import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/ProfilePageBloc.dart';
import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:flutter/material.dart';

import 'DrawerPage.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfilePage(this._profilePageBloc);

  final ProfilePageBloc _profilePageBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(CurrentDrawerPage.PROFILE_PAGE),
      appBar: AppBar(

        brightness: Brightness.light,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
              height: 26,
              width: 204,
              child: Text(EngStrings.PROFILE,
                  style: Theme.of(context).textTheme.title)),
        ),

        leading: IconButton(
            icon: Icon(Icons.toc),
            color: ThemeConfig.PURPLE_,
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
      decoration: BoxDecoration(color: ThemeConfig.WHITE_SMOKE),
      child: Center(
        child: Container(
              width: MediaQuery.of(context).size.height * photoheight,
              height: MediaQuery.of(context).size.height * photowidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(2, 0, 255, 0.15),
                      blurRadius: 50,
                      offset: Offset(0, 2))
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/face.png"),
                ),
              ),
            )
      ),
    );
  }

  Container _profilePageDetails(BuildContext context,
      {double height = 1, double width = 1}) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(color: ThemeConfig.WHITE_SMOKE),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: 32,
              child: StreamBuilder(
                  stream:
                      ProfilePageBloc.internal().streamControllerProfileInfo,
                  builder: (context, snapshot) {
                    return Text(
                        'Antoni Kowalski',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .display2
                            .copyWith(color: ThemeConfig.BLUE_GRAY));
                  })),
          Expanded(
//            margin: EdgeInsets.fromLTRB(8, 0, 8, 32),
//            height: 58,
            child: ListView(
              children: <Widget>[
                Text('Twoje dane\n\n',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: ThemeConfig.BLUE_LIGHT_GRAY)),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 20),
                          child: Text(
                                    'Uczulenia:      \n\n'
                                    'Choroby:     \n\n'
                                    'Lubisz:    \n\n'
                                    'Nie lubisz:\n\n'
                                    'Potrzeby:  \n',

//                            textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(color: ThemeConfig.BLUE_GRAY))
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 1.0, left:20),
                            child: Text(
                                'orzechy\n\n'
                                'cukrzyca\n\n'
                                'owoce morza, indyk, warzywa\n\n'
                                'pomidorów\n\n'
                                'urzymanie aktualnej wagi\n',
//                            textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(color: ThemeConfig.BLUE_GRAY))
                        ),
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
}
