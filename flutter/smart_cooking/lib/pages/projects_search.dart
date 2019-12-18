import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/blocs/search_bloc.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/project_card.dart';
import 'package:flutter/material.dart';

class ProjectsSearch extends SearchDelegate {
  List<ProjectModel> _projectModels;

  ProjectsSearch(this._projectModels);

  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme,
      primaryColor: theme.backgroundColor,
      primaryIconTheme: theme.iconTheme,
      iconTheme: theme.iconTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchProjects(query, _projectModels, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchProjects(query, _projectModels, context);
//    if (query.trim() == '') {
//      return Container(
//        color: ThemeConfig.WHITE_SMOKE,
//        child: Center(
//          child: Text(EngStrings.SEARCH,
//              style: Theme.of(context)
//                  .textTheme
//                  .title
//                  .copyWith(color: ThemeConfig.BLUE_LIGHT_GRAY)),
//        ),
//      );
//    }
//    searchBloc(query, context);
//    return StreamBuilder(
//        stream: searchBloc.getSearchResultsStream(query),
//        builder: (BuildContext context,
//            AsyncSnapshot<List<ProjectModel>> _snapshot) {
//          if (_snapshot.hasData) {
//            if (_snapshot.data.length == 0) {
//              return NoResults();
//            }
//            _projectModels = _snapshot.data;
//            return ListView.builder(
//                itemCount: _projectModels.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return ProjectCard(_projectModels[index], _bloc, query);
//                });
//          } else if (_snapshot.hasError) {
//            throw Exception(_snapshot.error);
//          }
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        });
  }
}

class _SearchProjects extends StatelessWidget {
  final List<ProjectModel> _projectModels;
  final String query;
  SearchBloc _searchBloc;

  _SearchProjects(this.query, this._projectModels, BuildContext context){
    _searchBloc = SearchBloc(_projectModels, context);
  }


  @override
  Widget build(BuildContext context) {
    if (query.trim() == '')
      return Container(
        color: ThemeConfig.WHITE_SMOKE,
        child: Center(
          child: Text(EngStrings.SEARCH,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: ThemeConfig.BLUE_LIGHT_GRAY)),
        ),
      );
    else {
      ProjectBloc _bloc = ProjectBloc(context);
      return StreamBuilder(
        stream: _searchBloc.getSearchResultsStream(query),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return NoResults();
            }
            final projectsList = snapshot.data;
            return ListView.builder(
                itemCount: projectsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCard(_projectModels[index], _bloc, query);
                });
          } else if (snapshot.hasError) {
            throw Exception(snapshot.error);
          }
          return Container(
            color: ThemeConfig.WHITE_SMOKE,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    }
    }}
