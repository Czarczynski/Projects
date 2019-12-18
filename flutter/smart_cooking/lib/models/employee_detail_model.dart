import 'package:smart_cooking/models/room_model.dart';

class EmployeeDetailModel {
  String name;
  RoomsModel workplace;

  EmployeeDetailModel(this.name, this.workplace);

  factory EmployeeDetailModel.fromJson(Map<String, dynamic> json) {
    return EmployeeDetailModel(json['name'], json['workplace'] != null ? RoomsModel.fromJson(json['workplace']) : RoomsModel.empty());
  }
}
