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
        brightness: Brightness.dark,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _biggerButton(context, bigger),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _saveRecipeButton(context, _scaffoldKey),
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
                color: Theme.of(context).iconTheme.color, size: 24)),
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 12),
              child: Center(
                child: Text('${widget._recipeModel.title}',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 24),
                    maxLines: null),
              ),
            ),
            preferredSize: widget._recipeModel.title.length <= 30
                ? Size.fromHeight(40.0)
                : widget._recipeModel.title.length <= 50
                    ? Size.fromHeight(60.0)
                    : widget._recipeModel.title.length <= 70
                        ? Size.fromHeight(80.0)
                        : Size.fromHeight(100.0)),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 20),
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
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                        itemCount: widget._recipeModel.analyzedInstructions[0]
                                .steps.length +
                            widget._recipeModel.extendedIngredients.length +
                            5,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4),
                              child: Text(
                                  'Cooking time: ${widget._recipeModel.readyInMinutes} min',
                                  style: Theme.of(context).textTheme.display4),
                            );
                          } else if (index == 1) {
                            return Row(
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
                            );
                          } else if (index == 2) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: widget._recipeModel.image != null
                                  ? Image.network(widget._recipeModel.image)
                                  : Container(),
                            );
                          } else if (index == 3) {
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
                          } else if (index >= 4 &&
                              index <
                                  widget._recipeModel.extendedIngredients
                                          .length +
                                      4) {
                            return Container(
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
                                          color: widget
                                                          ._recipeModel
                                                          .extendedIngredients
                                                          .length +
                                                      3 ==
                                                  index
                                              ? Theme.of(context)
                                                  .iconTheme
                                                  .color
                                              : Colors.black54))),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      left: 10,
                                      right: 10,
                                      bottom: 6),
                                  child: Text(
                                    "${widget._recipeModel.extendedIngredients[index - 4].originalString}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                  )),
                            );
                          } else if (index ==
                              4 +
                                  widget._recipeModel.extendedIngredients
                                      .length) {
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
                                    "\nStep ${index - 4 - widget._recipeModel.extendedIngredients.length}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                          widget
                                              ._recipeModel
                                              .analyzedInstructions[0]
                                              .steps[index -
                                                  5 -
                                                  widget
                                                      ._recipeModel
                                                      .extendedIngredients
                                                      .length]
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
      child: Icon(_bigger ? Icons.zoom_out : Icons.zoom_in),
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
                  onPressed: (){},
                ),
              ))
          : () {
              StarredBloc("${widget._recipeModel.id}");
              setState((){});
            },
      child: already
          ? Icon(
              Icons.star,
              color: Colors.amber,
            )
          : Icon(Icons.star_border),
    );
  }
}
