import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/models/recipe_model.dart';

class RecipesBloc extends ChangeNotifier {
  List<RecipesModel> recipeModels = List<RecipesModel>();
  bool _isInProgress = true;
  final BuildContext context;

  bool get isInProgress => _isInProgress;

  RecipesBloc(this.context) {
    _getRecipeModels().then((_list) {
      recipeModels = _list.recipes;
      _isInProgress = false;
      notifyListeners();
    });
  }

  Future<RecipeModel> _getRecipeModels() async {
    try {
      final response = await http
          .get('${AppConfig.RAPID_API_URL}/recipes/random?number=9', headers: {
        "x-rapidapi-host": AppConfig.RAPID_API_HOST,
        "x-rapidapi-key": AppConfig.RAPID_API_KEY
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
  final BuildContext context;

  RecipeByIdBloc(this.id, this.context) {
    _getRecipeById().then((_item) {
      recipe = _item;
      notifyListeners();
    });
  }

  Future<RecipesModel> _getRecipeById() async {
    try {
      final response = await http
          .get('${AppConfig.RAPID_API_URL}/recipes/$id/information', headers: {
        "x-rapidapi-host": AppConfig.RAPID_API_HOST,
        "x-rapidapi-key": AppConfig.RAPID_API_KEY
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
          .get('${AppConfig.RAPID_API_URL}/recipes/$id/information', headers: {
        "x-rapidapi-host": AppConfig.RAPID_API_HOST,
        "x-rapidapi-key": AppConfig.RAPID_API_KEY
      });
      return RecipesModel.fromJson(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }
}
