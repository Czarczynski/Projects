import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/recipe_model.dart';

class RecipesResultBloc extends ChangeNotifier {
  List<RecipesModel> recipeModels = List<RecipesModel>();
  final BuildContext context;
  bool _isInProgress = true;
  final String cuisine, diet;
  bool get isInProgress => _isInProgress;

  RecipesResultBloc(this.context, this.cuisine, this.diet) {
    _getRecipeModels().then((RecipeModel _list) {
      recipeModels = _list.results;
      _isInProgress = false;
      notifyListeners();
    });
  }

  Future<RecipeModel> _getRecipeModels() async {
    try {
      final response = await http
          .get('${Config.RAPID_API_URL}/recipes/search?query=all&number=100${cuisine=='all' ? "" : "&cuisine="+cuisine}${diet=='all' ? "" : "&diet="+diet}', headers: {
        "x-rapidapi-host": Config.RAPID_API_HOST,
        "x-rapidapi-key": Config.RAPID_API_KEY
      });
      if (response.statusCode == 200)
        return RecipeModel.fromJson(json.decode(response.body));
      else
        throw Exception('Failed while getting recipes');
    } catch (error) {
      throw error;
    }
  }
}

class RecipeByIdBloc extends ChangeNotifier {
  RecipesModel recipe;
  final String id;
  bool _isInProgress = true;

  bool get isInProgress => _isInProgress;

  RecipeByIdBloc(this.id) {
    _getRecipeById().then((_item) {
      recipe = _item;
      _isInProgress = false;
      notifyListeners();
    });
  }

  Future<RecipesModel> _getRecipeById() async {
    try {
      final response = await http
          .get('${Config.RAPID_API_URL}/recipes/$id/information', headers: {
        "x-rapidapi-host": Config.RAPID_API_HOST,
        "x-rapidapi-key": Config.RAPID_API_KEY
      });
      return RecipesModel.fromJson(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }
}

class HistoryBloc extends ChangeNotifier {
  final String _ids;
  List<String> _listOfId;
  List<RecipesModel> recipeModels = [];
  final BuildContext context;
  bool _isInProgress = true;

  bool get isInProgress => _isInProgress;

  HistoryBloc(this._ids, this.context) {
    _listOfId = _ids.split(',');

    _listOfId.reversed.forEach((item) {
      _getRecipeById(item).then((_item) {
        recipeModels.add(_item);
        _isInProgress = false;
        notifyListeners();
      });
    });
  }

  Future<RecipesModel> _getRecipeById(String id) async {
    try {
      final response = await http
          .get('${Config.RAPID_API_URL}/recipes/$id/information', headers: {
        "x-rapidapi-host": Config.RAPID_API_HOST,
        "x-rapidapi-key": Config.RAPID_API_KEY
      });
      return RecipesModel.fromJson(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }
}
