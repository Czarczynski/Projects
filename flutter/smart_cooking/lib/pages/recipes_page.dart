import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/recipes_list.dart';
import 'package:smart_cooking/pages/projects_search.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = RecipesBloc(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          EngStrings.RECIPES,
          style: Theme.of(context).textTheme.title,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 16),
            child: InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: RecipesSearch(_bloc.recipeModels),
                );
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      drawer: DrawerPage(CurrentDrawerPage.RECIPES_PAGE),
      body: RecipesList(context),
    );
  }
}
