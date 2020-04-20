import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:smart_cooking/pages/recipe_card.dart';

class RecipesList extends StatefulWidget {
  final String cuisine, diet, type;
  final RecipesResultBloc _bloc;
  RecipesList(this.context, this.cuisine, this.diet, this.type, this._bloc);

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
            child: widget._bloc.recipeModels.length == 0 ?
                  NoResults()
                : Column(
                    children: <Widget>[
                      Container(
                          child: (widget.type != 'all' ||
                                  widget.cuisine != 'all' ||
                                  widget.diet != 'all')
                              ? Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.filter_list,
                                            color: Theme.of(context)
                                                .textTheme
                                                .display4
                                                .color,
                                            size: 20,
                                          ),
                                          Text(
                                            "Filters",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .display4
                                                    .color,
                                                fontSize: 15,
                                                fontWeight:
                                                    FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          widget.type != 'all'
                                              ? _filters(
                                                  context,
                                                  widget.type,
                                                  Colors.lightGreen)
                                              : Container(),
                                          widget.cuisine != 'all'
                                              ? _filters(
                                                  context,
                                                  widget.cuisine,
                                                  Colors.green)
                                              : Container(),
                                          widget.diet != 'all'
                                              ? _filters(
                                                  context,
                                                  widget.diet,
                                                  Colors.greenAccent)
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container()),
                      Expanded(
                        child: ListView(children: <Widget>[
                          Wrap(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: widget._bloc.recipeModels
                                .map((item) => RecipeCard(item, ''))
                                .toList(),
                          ),
                        ]),
                      )
                    ],
                  )
        )


      ],
    );
  }
}

Container _filters(BuildContext _context, String _filter, Color _color) =>
    Container(
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(_filter,
            style: Theme.of(_context)
                .textTheme
                .title
                .copyWith(color: Colors.white)));
