import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_cooking/models/recipe_model.dart';
import 'package:smart_cooking/pages/recipes_details_page.dart';

import '../app_config.dart';

class RecipeCard extends StatefulWidget {
  final RecipesModel _recipeModel;
  bool fullRecipe;
  final String query;

  RecipeCard(this._recipeModel, this.query, {this.fullRecipe = false});

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  List<TextSpan> _getSpans(String text, String matchWord) {
    List<TextSpan> spans = [];
    int index = 0;
    if (matchWord == '') {
      spans.add(TextSpan(text: text));
      return spans;
    } else {
      while (index < text.length) {
        if (index == text.toLowerCase().indexOf(matchWord.toLowerCase())) {
          spans.add(TextSpan(
              text: text.substring(index, index + matchWord.length),
              style: TextStyle(color: Colors.red)));
          text = text.substring(index + matchWord.length);
          index = 0;
        } else {
          spans.add(TextSpan(text: text[index]));
          index++;
        }
      }
      return spans;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipesDetailsPage(widget._recipeModel.id)));
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          color: Theme.of(context).textTheme.display2.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(color: Theme.of(context).cursorColor),
                          children: _getSpans(
                              widget._recipeModel.title, widget.query),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time,
                              color: Theme.of(context).textTheme.body1.color),
                          Text(" ${widget._recipeModel.readyInMinutes} minutes",
                              style: Theme.of(context)
                                  .textTheme
                                  .display4
                                  .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .color)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.network(
                  widget._recipeModel.image == null
                      ? Config.DEFAULT_FOOD_IMAGE
                      : widget.fullRecipe
                          ? widget._recipeModel.image
                          : "https://spoonacular.com/recipeImages/${widget._recipeModel.image}",
                  fit: BoxFit.cover,
                  frameBuilder: (BuildContext context, Widget child, int frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      child: child,
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
