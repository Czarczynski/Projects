import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/http_links_bloc.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/custom-painters/circular_progress_view.dart';
import 'package:smart_cooking/custom-painters/custom_confirm_vote_dialog.dart';
import 'package:smart_cooking/custom-painters/custom_flushbar.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:flutter/material.dart';

class ProjectsDetailsPage extends StatefulWidget {
  final ProjectModel _projectModel;
  final ProjectBloc _bloc;

  ProjectsDetailsPage(this._projectModel, this._bloc);

  @override
  _ProjectsDetailsPageState createState() => _ProjectsDetailsPageState();
}

class _ProjectsDetailsPageState extends State<ProjectsDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _biggerButton(context, bigger),
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                color: Theme.of(context).iconTheme.color, size: 24)),
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 12),
              child: Center(
                child: Text('${widget._projectModel.title}',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 24),
                    maxLines: null),
              ),
            ),
            preferredSize: widget._projectModel.title.length <= 30
                ? Size.fromHeight(40.0)
                : widget._projectModel.title.length <= 50
                    ? Size.fromHeight(60.0)
                    : widget._projectModel.title.length <= 70
                        ? Size.fromHeight(80.0)
                        : Size.fromHeight(100.0)),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 70),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          blurRadius: 20,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 4),
                        child: Text('Stopień trudności',
                            style: Theme.of(context).textTheme.display4),
                      ),
                      Row(
                        children: <Widget>[
                          Visibility(
                            visible: !widget._projectModel.completed,
                            child: Expanded(
                              flex: widget._projectModel.amount,
                              child: DecoratedBox(
                                child: SizedBox(
                                  height: 4,
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0xFF84C7FF),
                                  Color(0xFF3116C2)
                                ])),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: (widget._projectModel.budget -
                                widget._projectModel.amount),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: widget._projectModel.completed
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).disabledColor,
                              ),
                              child: SizedBox(
                                height: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: widget._projectModel.photo != null
                            ? Image(
                                image: AssetImage(widget._projectModel.photo))
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                        child: Text(EngStrings.DESCRIPTION,
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(
                                    color: ThemeConfig.BLUE_GRANADE,
                                    fontSize: 30)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(children: <Widget>[
                            Text(widget._projectModel.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        color: ThemeConfig.BLUE_GRANADE,
                                        fontSize: bigger ? 15 : 13))
                          ])),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _biggerButton(BuildContext context, bool _bigger) {
    return InkWell(
        onTap: () {
          bigger = !bigger;
          setState(() {
            return null;
          });
        },
        child: Icon(_bigger ? Icons.zoom_out :Icons.zoom_in),
    );
  }
}
