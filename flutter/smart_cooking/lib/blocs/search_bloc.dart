import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:flutter/cupertino.dart';

class SearchBloc {
  final List<ProjectModel> _projectsModel;
  final BuildContext context;
  SearchBloc(this._projectsModel, this.context);

  List<ProjectModel> searchModels(String query) {
    try {
      return _projectsModel.where((_item) {
        if (_item.title.toLowerCase().contains(query.toLowerCase()))
          return true;
        else
          return false;
      }).toList();
    } catch (error) {
      throw error;
    }
  }

  Stream<List<ProjectModel>> getSearchResultsStream(String query) {
    return Future.value(searchModels(query)).catchError((_){
      WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
    }).asStream();
  }
}
