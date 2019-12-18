import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/models/employee_detail_model.dart';
import 'package:smart_cooking/models/employees_model.dart';
import 'package:smart_cooking/models/room_model.dart';
import 'package:flutter/material.dart';

class EmployeesBloc extends ChangeNotifier {
  List<EmployeeDetailModel> employeesList = [];
  final List<RoomsModel> roomList = [];

  EmployeesBloc(BuildContext context) {
    _getEmployees().then((_list) {
      employeesList = _list;
      employeesList.forEach((emplyeeDetails) {
        if (roomList
            .where((room) => room.room == emplyeeDetails.workplace.room)
            .isEmpty) {
          roomList.add(emplyeeDetails.workplace);
        }
      });
      notifyListeners();
    }).catchError((e) {
      WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
    });


    notifyListeners();
  }

  Future<List<EmployeeDetailModel>> _getEmployees() async {
    try {
      final response =
          await AppuniteHttpClient().get('/api/v1/employees?limit=100');
      return EmployeesModel.fromJson(response.data).employeeDetails;
    } catch (error) {
      throw error;
    }
  }
}
