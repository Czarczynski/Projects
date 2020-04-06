import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/search_bloc.dart';
import 'package:smart_cooking/models/recipe_model.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';

class RecipesSearch extends SearchDelegate {
  List<RecipesModel> _recipesModels;

  RecipesSearch(this._recipesModels);

  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      backgroundColor: theme.backgroundColor,
        appBarTheme: theme.appBarTheme,
        primaryColor: theme.backgroundColor,
        primaryIconTheme: theme.iconTheme,
        iconTheme: theme.iconTheme);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query != '' ?() {
            query = '';
          } : null,
          icon: Icon(Icons.backspace))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchRecipes(query, _recipesModels, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchRecipes(query, _recipesModels, context);
  }
}

// ignore: must_be_immutable
class _SearchRecipes extends StatelessWidget {
  final List<RecipesModel> _projectModels;
  final String query;
  SearchBloc _searchBloc;

  _SearchRecipes(this.query, this._projectModels, BuildContext context) {
    _searchBloc = SearchBloc(_projectModels, context);
  }

  @override
  Widget build(BuildContext context) {
    if (query.trim() == '')
      return Center(
        child: Text(EnglishVer.SEARCH,
            style: Theme.of(context)
                .textTheme
                .title),
      );
    else {
      return StreamBuilder(
        stream: _searchBloc.getSearchResultsStream(query),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data.length == 0
                  ? NoResults()
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RecipeCard(_projectModels[index], query);
                      })
              : snapshot.hasError
                  ? throw Exception(snapshot.error)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
      );
    }
  }
}
