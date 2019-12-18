import 'dart:async';

import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/models/employee_detail_model.dart';
import 'package:flutter/material.dart';

class RoomsEmployeesSearchBloc {
  final List<EmployeeDetailModel> _employeesModel;
final BuildContext context;
  RoomsEmployeesSearchBloc(this._employeesModel, this.context);

  List<EmployeeDetailModel> searchModels(String query) {
    try {
      return _employeesModel.where((_item) {
        if (_item.name.toLowerCase().contains(query.toLowerCase()))
          return true;
        else
          return false;
      }).toList();
    } catch (error) {
      throw error;
    }
  }

  Stream<List<EmployeeDetailModel>> getSearchResultsStream(String query) {
    return Future.value(searchModels(query)).catchError((_){
      WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
    }).asStream();
  }
}
