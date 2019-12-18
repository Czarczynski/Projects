import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/pages/DrawerPage.dart';
import 'package:smart_cooking/pages/projects_list.dart';
import 'package:smart_cooking/pages/projects_search.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = ProjectBloc(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          EngStrings.WALLET,
          style: Theme.of(context).textTheme.title,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 16),
            child: InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: ProjectsSearch(_bloc.projectModels),
                );
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      drawer: DrawerPage(CurrentDrawerPage.PROJECTS_PAGE),
      body: ProjectsList(context),
    );
  }
}
