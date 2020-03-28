import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/starred_bloc.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/models/recipe_model.dart';

class RecipesDetailsPage extends StatefulWidget {
  final RecipesModel _recipeModel;

  RecipesDetailsPage(this._recipeModel);

  @override
  _RecipesDetailsPageState createState() => _RecipesDetailsPageState();
}

class _RecipesDetailsPageState extends State<RecipesDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool bigger = false;

  @override
  Widget build(BuildContext context) {
    UserBloc.internal().fetchData();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
//        title: Text(widget._recipeModel.title,
//            style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
//            maxLines: null),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom:8),
          child: _biggerButton(context, bigger),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _saveRecipeButton(context, _scaffoldKey),
        )
      ],
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          blurRadius: 20,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: ListView.builder(
                        itemCount: widget._recipeModel.analyzedInstructions[0]
                                .steps.length +
                            6,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(widget._recipeModel.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontSize: 24),
                                  textAlign: TextAlign.center,
                                  maxLines: null),
                            );
                          } else if (index == 2) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4, top: 4),
                              child: Text(
                                  'Cooking time: ${widget._recipeModel.readyInMinutes} min',
                                  style: Theme.of(context).textTheme.display4),
                            );
                          } else if (index == 3) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Visibility(
                                    visible: true,
                                    child: Expanded(
                                      flex: widget._recipeModel.readyInMinutes,
                                      child: DecoratedBox(
                                        child: SizedBox(
                                          height: 4,
                                        ),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Color(0xFF84C7FF),
                                          Color(0xFF3116C2)
                                        ])),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: (200 -
                                        widget._recipeModel.readyInMinutes),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).disabledColor,
                                      ),
                                      child: SizedBox(
                                        height: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (index == 1) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: Image.network(widget._recipeModel.image ??
                                  AppConfig.DEFAULT_FOOD_IMAGE),
                            );
                          } else if (index == 4) {
                            return Container(
                                padding: EdgeInsets.only(bottom: 0),
                                color: Theme.of(context).iconTheme.color,
                                child: Text(EngStrings.INGREDIENTS,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                            color: ThemeConfig.WHITE_SMOKE,
                                            fontSize: 23)));
                          } else if (index == 5) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color),
                                      right: BorderSide(
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color),
                                      bottom: BorderSide(
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color))),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ToggleButtons(
                                  children: widget
                                      ._recipeModel.extendedIngredients
                                      .map((_item) => RotatedBox(
                                            quarterTurns: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                    "${_item.originalString}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  renderBorder: false,
                                  isSelected: widget
                                      ._recipeModel.extendedIngredients
                                      .map((_item) => _item.haveIt)
                                      .toList(),
                                  onPressed: (index) {
                                    setState(() {
                                      widget
                                              ._recipeModel
                                              .extendedIngredients[index]
                                              .haveIt =
                                          !widget
                                              ._recipeModel
                                              .extendedIngredients[index]
                                              .haveIt;
                                    });
                                  },
                                  selectedColor: Colors.green,
                                ),
                              ),
                            );
                          } else if (index == 6) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8),
                              child: Text(EngStrings.DESCRIPTION,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                          color: ThemeConfig.BLUE_GRANADE,
                                          fontSize: 30)),
                            );
                          } else {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "\nStep ${index - 6}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, bottom: 10),
                                      child: Text(
                                          widget
                                              ._recipeModel
                                              .analyzedInstructions[0]
                                              .steps[index - 7]
                                              .step,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(
                                                  color:
                                                      ThemeConfig.BLUE_GRANADE,
                                                  fontSize: bigger ? 22 : 16)))
                                ]);
                          }
                        }))),
          ],
        ),
      ),
    );
  }

  InkWell _biggerButton(BuildContext context, bool _bigger) {
    return InkWell(
      onTap: () {
        bigger = !bigger;
        setState(() {
          return null;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8),
        child: Icon(_bigger ? Icons.zoom_out : Icons.zoom_in),
      ),
    );
  }

  InkWell _saveRecipeButton(
      BuildContext context, GlobalKey<ScaffoldState> _key) {
    bool already = false;
    List<String> _starredId =
        UserBloc.internal().profileInfo.starred.split((","));

    _starredId.forEach((_id) {
      if (int.parse(_id) == widget._recipeModel.id) {
        already = true;
        return null;
      }
    });
    return InkWell(
      onTap: already
          ? () => _key.currentState.showSnackBar(SnackBar(
                content: Text("Already saved\nDo You want to unsave?"),
                action: SnackBarAction(
                  label: "Yes",
                  onPressed: () {},
                ),
              ))
          : () {
              StarredBloc("${widget._recipeModel.id}");
              setState(() {});
            },
      child: already
          ? Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Icon(
                Icons.star,
                color: Colors.amber,
              ),
          )
          : Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Icon(Icons.star_border),
          ),
    );
  }
}
