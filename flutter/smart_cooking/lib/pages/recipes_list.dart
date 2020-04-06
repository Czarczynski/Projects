import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';

class RecipesList extends StatefulWidget {
  final String cuisine, diet, type;

  RecipesList(this.context, this.cuisine, this.diet, this.type);

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
            child: ChangeNotifierProvider<RecipesResultBloc>(
                create: (context) =>
                    RecipesResultBloc(context, widget.cuisine, widget.diet, widget.type),
                child: Consumer<RecipesResultBloc>(
                  builder: (context, RecipesResultBloc _bloc, _) {
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
                                EnglishVer.TODAY_S_RECIPES,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 20,
                                        color: Theme.of(context).canvasColor,
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
