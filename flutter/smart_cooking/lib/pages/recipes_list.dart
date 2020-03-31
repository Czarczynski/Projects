import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';

class RecipesList extends StatefulWidget {
  RecipesList(this.context);

  final BuildContext context;

  @override
  _RecipesListState createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: ChangeNotifierProvider<RecipesBloc>(
                create: (context) => RecipesBloc(context),
                child: Consumer<RecipesBloc>(
                  builder: (context, RecipesBloc _bloc, _) {
                    if (_bloc.isInProgress) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (_bloc.recipeModels.length == 0) {
                      return NoResults();
                    } else
                      return ListView.builder(
                        itemCount: _bloc.recipeModels.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0)
                            return Center(
                              child: Text(
                                EngStrings.TODAY_S_RECIPES,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 20,
                                        color: ThemeConfig.ST_TROPAZ,
                                        letterSpacing: 1.5),
                              ),
                            );
                          return RecipeCard(_bloc.recipeModels[index - 1], '');
                        },
                      );
                  },
                )))
      ],
    );
  }
}
