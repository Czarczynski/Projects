import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/recipe_model.dart';
import 'package:smart_cooking/pages/recipes_details_page.dart';

class RecipeCard extends StatefulWidget {
  final RecipesModel _recipeModel;
  final String query;

  RecipeCard(this._recipeModel, this.query);

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
                    RecipesDetailsPage(widget._recipeModel)));
      },
      child: Card(
        color: DarkThemeConfig.WHITE,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(25),
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
                        style: Theme.of(context).textTheme.display1.copyWith(color: DarkThemeConfig.REAL_BLACK),
                        children:
                            _getSpans(widget._recipeModel.title, widget.query),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.network(widget._recipeModel.image ?? Config.DEFAULT_FOOD_IMAGE,width: 90,),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4, right: 10),
                    child: Text(EnglishVer.COOKING_TIME,
                        style: Theme.of(context).textTheme.display4.copyWith(color: DarkThemeConfig.BLUE_GRANADE)),
                  ),
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
//                          Color(0xFF84C7FF),
//                          Color(0xFF3116C2)
                          Color(0xFF7b3800),
                          Color(0xFFcee93d)
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
            ],
          ),
        ),
      ),
    );
  }
}
