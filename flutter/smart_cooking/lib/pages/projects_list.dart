import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/project_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsList extends StatefulWidget {
  ProjectsList(this.context);
  final BuildContext context;
  @override
  _ProjectsListState createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  ProjectBloc _bloc;

  @override
  void initState() {
    _bloc = ProjectBloc(widget.context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text("Dzisiejsze propozycje dla Ciebie!",style: Theme.of(context)
            .textTheme
            .display1
            .copyWith(
            fontSize: 20, color: ThemeConfig.ST_TROPAZ, letterSpacing: 1.5),),
        Expanded(
          child: StreamBuilder<List<ProjectModel>>(
            stream: _bloc.projectsStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<ProjectModel>> _snapshot) {
              if (_snapshot.hasData) {
                if (_snapshot.data.length == 0) {
                  return NoResults();
                }
                _bloc.refreshDonations(_snapshot.data);
                return ListView.builder(
                  itemCount: _snapshot.data.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _snapshot.data.length) {
                      _bloc.generateMore();
                      if (!_bloc.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: 0,
                        height: 0,
                      );
                    }
                    return ProjectCard(_snapshot.data[index], _bloc, '');
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
