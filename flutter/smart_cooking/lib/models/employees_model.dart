import 'package:smart_cooking/models/employee_detail_model.dart';

class EmployeesModel {
  final List<EmployeeDetailModel> employeeDetails;

  EmployeesModel(this.employeeDetails);

  factory EmployeesModel.fromJson(Map<String, dynamic> json) {
    return EmployeesModel((json['employees'] as List)
        .map((_item) => EmployeeDetailModel.fromJson(_item))
        .toList());
  }
}
