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
      return StreamBuilder(
        stream: _searchBloc.getSearchResultsStream(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return NoResults();
            }
            final projectsList = snapshot.data;
            return ListView.builder(
                itemCount: projectsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RecipeCard(_projectModels[index], query);
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
  }
}
