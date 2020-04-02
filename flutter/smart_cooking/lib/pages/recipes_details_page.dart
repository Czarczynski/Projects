import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/starred_bloc.dart';
import 'package:smart_cooking/blocs/user_bloc.dart';
import 'package:smart_cooking/models/recipe_model.dart';
import 'package:smart_cooking/store/photo_saver.dart';

class RecipesDetailsPage extends StatefulWidget {
  final RecipesModel _recipeModel;

  RecipesDetailsPage(this._recipeModel);

  @override
  _RecipesDetailsPageState createState() => _RecipesDetailsPageState();
}

class _RecipesDetailsPageState extends State<RecipesDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool bigger = false, already = false;

  @override
  Widget build(BuildContext context) {
    UserBloc.internal().fetchData();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              brightness: Brightness.dark,
              backgroundColor: Theme.of(context).backgroundColor,
              expandedHeight: 200,
              floating: false,
              pinned: true,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: _biggerButton(context, bigger),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _saveRecipeButton(context, _scaffoldKey),
                )
              ],
              flexibleSpace: InkWell(
                onLongPress: () {
                  saveImage(
                    context,
                    widget._recipeModel.image ?? Config.DEFAULT_FOOD_IMAGE,
                  );
                },
                child: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.none,
                    background: Image.network(
                      widget._recipeModel.image ?? Config.DEFAULT_FOOD_IMAGE,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ];
        },
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 50),
            decoration: BoxDecoration(
                color: DarkThemeConfig.WHITE,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 20,
                      offset: Offset(0, 2))
                ]),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
                child: ListView.builder(
                    itemCount: widget
                            ._recipeModel.analyzedInstructions[0].steps.length +
                        5,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Text(widget._recipeModel.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontSize: 24),
                              textAlign: TextAlign.center),
                        );
                      } else if (index == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4, top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  'Cooking time: ${widget._recipeModel.readyInMinutes} min',
                                  style: Theme.of(context).textTheme.display4.copyWith(fontSize:20)),
                              Row(
                                children: <Widget>[
                                  Text("${widget._recipeModel.aggregateLikes} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .display4
                                          .copyWith(fontSize: 20)),
                                  Icon(Icons.thumb_up,
                                      color: DarkThemeConfig.PURPLE_)
                                ],
                              )
                            ],
                          ),
                        );
                      } else if (index == 2) {
                        return Container();
                      } else if (index == 3) {
                        return Container(
                            padding: EdgeInsets.only(bottom: 0),
                            color: Theme.of(context).iconTheme.color,
                            child: Text(EnglishVer.INGREDIENTS,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        color: DarkThemeConfig.WHITE_SMOKE,
                                        fontSize: 23)));
                      } else if (index == 4) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Theme.of(context).iconTheme.color),
                                  right: BorderSide(
                                      color: Theme.of(context).iconTheme.color),
                                  bottom: BorderSide(
                                      color:
                                          Theme.of(context).iconTheme.color))),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: ToggleButtons(
                              fillColor: Colors.white12,
                              children: widget._recipeModel.extendedIngredients
                                  .map((_item) => RotatedBox(
                                        quarterTurns: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                                "${_item.originalString}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 15, color: DarkThemeConfig.BLUE_GRAY)),
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
                                  widget._recipeModel.extendedIngredients[index]
                                          .haveIt =
                                      !widget._recipeModel
                                          .extendedIngredients[index].haveIt;
                                });
                              },
                            ),
                          ),
                        );
                      } else if (index == 5) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                          child: Text(EnglishVer.DESCRIPTION,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                      color: DarkThemeConfig.BLUE_GRANADE,
                                      fontSize: 30)),
                        );
                      } else {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "\nStep ${index - 5}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                )                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10),
                                  child: Text(
                                      widget
                                          ._recipeModel
                                          .analyzedInstructions[0]
                                          .steps[index - 6]
                                          .step,
                                      style: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              color: DarkThemeConfig.BLACK,
                                              fontSize: bigger ? 22 : 16)))
                            ]);
                      }
                    }))),
      ),
    );
  }

  InkWell _biggerButton(BuildContext context, bool _bigger) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        bigger = !bigger;
        setState(() {
          return null;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Icon(
            _bigger ? Icons.zoom_out : Icons.zoom_in,
          ),
        ),
      ),
    );
  }

  InkWell _saveRecipeButton(
      BuildContext context, GlobalKey<ScaffoldState> _key) {
    List<String> _starredId =
        UserBloc.internal().profileInfo.starred.split((","));
    _starredId.forEach((_id) {
      if (int.parse(_id) == widget._recipeModel.id) {
        already = true;
      }
    });
    return already
        ? InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => _key.currentState.showSnackBar(SnackBar(
                  content: Text("Already saved\nDo You want to unsave?"),
                  action: SnackBarAction(
                    label: "Yes",
                    onPressed: () {},
                  ),
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ))
        : InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              already = true;
              postStarred("${widget._recipeModel.id}");
              setState(() => null);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(Icons.star_border),
              ),
            ),
          );
  }
}
