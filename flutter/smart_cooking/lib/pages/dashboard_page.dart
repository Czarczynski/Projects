import 'package:smart_cooking/blocs/logout_button.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/blocs/slack_bot_bloc.dart';
import 'package:smart_cooking/custom-painters/custom_flushbar.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/pages/DrawerPage.dart';
import 'package:smart_cooking/pages/guidebook_page.dart';
import 'package:smart_cooking/pages/guidebook_page2.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/project_card.dart';
import 'package:smart_cooking/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SlackBotMessageBloc _slackBotMessageBloc = SlackBotMessageBloc();
  ProjectBloc _bloc;

  DashboardPage() {
    _bloc = ProjectBloc(_scaffoldKey.currentContext);
  }

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<List<ProjectModel>>(
          stream: _bloc.projectsStream,
          builder: (BuildContext context,
              AsyncSnapshot<List<ProjectModel>> _snapshot) {
            if (!_snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Visibility(
                      child: InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectsPage())),
                        child: _button(
                          context,
                          EngStrings.PLACE_IN_OFFICE,
                          LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF7472af), Color(0xFF403e77)]),
                        ),
                      ),
                    );
                  } else if (index == 1) {
                    return _text(context, "Urządzenia");
                  } else if (index == 2) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuideBook())),
                          child: _button(
                            context,
                            'URZĄDZENIA',
                            null,
                            width: 0.45,
                            marginright: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuideBook2())),
                          child: _button(
                            context,
                            'MOJE URZĄDZENIA',
                            null,
                            width: 0.45,
                            marginleft: 0,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 3) {
                    return _text(context, EngStrings.KITCHEN_ACTIONS);
                  } else if (index == 4) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showFlushBar(context, EngStrings.KITCHEN_SNACKBAR,
                                EngStrings.OK, () {});
                          },
                          child: _button(
                            context,
                            'ZAGOTUJ WODĘ',
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF7472af), Color(0xFF403e77)]),
                            width: 0.45,
                            marginright: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showFlushBar(context, EngStrings.SLIMAK_SNACKBAR,
                                EngStrings.OK, () {});
                          },
                          child: _button(
                            context,
                            'ZRÓB ESPRESSO',
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF7472af), Color(0xFF403e77)]),
                            width: 0.45,
                            marginleft: 0,
                          ),
                        ),
                      ],
                    );
                  } else if (index == 5) {
                    return _text(context, EngStrings.MY_WALLETS);
                  } else {
                    if (_snapshot.data.length > 0) {
                      _snapshot.data[index - 6].paid = true;
                      return ProjectCard(_snapshot.data[index - 6], _bloc, '');
                    } else {
                      return NoResults();
                    }
                  }
                });
          }),
    );
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          _text,
          style: Theme.of(_context)
              .textTheme
              .display2
              .copyWith(color: Colors.white70, fontWeight: FontWeight.w500),
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
