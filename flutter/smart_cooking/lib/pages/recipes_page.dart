import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/recipes_list.dart';
import 'package:smart_cooking/pages/recipes_search.dart';

class RecipesPage extends StatelessWidget {
  String cuisine, diet, type;

  RecipesPage({this.cuisine, this.diet, this.type});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipesResultBloc>(
        create: (context) =>
            RecipesResultBloc(context, this.cuisine, this.diet, this.type),
        child: Consumer<RecipesResultBloc>(
            builder: (context, RecipesResultBloc _bloc, _) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                EnglishVer.RECIPES,
                style: Theme.of(context).textTheme.title,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 16),
                  child: _bloc.isInProgress ? Container() : InkWell(
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
            body:_bloc.isInProgress ? Center(child: CircularProgressIndicator()) : RecipesList(context, this.cuisine, this.diet, this.type, _bloc),
          );

        }));
  }
}
