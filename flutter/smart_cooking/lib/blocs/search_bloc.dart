import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_cooking/models/recipe_model.dart';

class SearchBloc {
  final List<RecipesModel> _recipesModel;
  final BuildContext context;
  SearchBloc(this._recipesModel, this.context);

  List<RecipesModel> searchModels(String query) {
    try {
      return _recipesModel.where((_item) {
        if (_item.title.toLowerCase().contains(query.toLowerCase()))
          return true;
        else
          return false;
      }).toList();
    } catch (error) {
      throw error;
    }
  }

  Stream<List<RecipesModel>> getSearchResultsStream(String query) {
    return Future.value(searchModels(query)).catchError((_){
      WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
    }).asStream();
  }
}
