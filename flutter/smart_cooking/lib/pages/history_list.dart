import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/recipe_card.dart';

import '../app_config.dart';
import 'no_results.dart';

class HistoryList extends StatefulWidget {
  final String items;
  final bool history;
  HistoryList(this.context,this.items,this.history);

  final BuildContext context;

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          widget.history ? EngStrings.DESC_HISTORY : EngStrings.DESC_STARRED,
          style: Theme.of(context).textTheme.display1.copyWith(
              fontSize: 20, color: ThemeConfig.ST_TROPAZ, letterSpacing: 1.5),
        ),
        Expanded(
            child: ChangeNotifierProvider<HistoryBloc>(
                create: (context) => HistoryBloc(widget.items,context),
                child: Consumer<HistoryBloc>(
                  builder: (context, HistoryBloc _bloc, _) {
                    if (_bloc.recipeModels.length == 0) {
                      return NoResults();
                    }
                    return ListView.builder(
                      itemCount: _bloc.recipeModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (_bloc.recipeModels == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return RecipeCard(_bloc.recipeModels[index], '');
                      },
                    );
                  },
                )))
      ],
    );
  }
}