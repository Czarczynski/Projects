import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/recipe_model.dart';
import 'package:smart_cooking/pages/recipes_details_page.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RecipesDetailsPage(widget._recipeModel.id)));
      },
      child: Card(
        elevation: 5,
        color: Theme.of(context).textTheme.display2.color,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Theme.of(context).cursorColor),
                        children:
                            _getSpans(widget._recipeModel.title, widget.query),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.network(
                      widget._recipeModel.image == null
                          ? Config.DEFAULT_FOOD_IMAGE
                          : widget.fullRecipe
                              ? widget._recipeModel.image
                              : "https://spoonacular.com/recipeImages/${widget._recipeModel.image}",
                      height: 50,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                      EnglishVer.COOKING_TIME +
                          ": ${widget._recipeModel.readyInMinutes}min",
                      style: Theme.of(context).textTheme.display4.copyWith(
                          color: Theme.of(context).textTheme.body1.color)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
