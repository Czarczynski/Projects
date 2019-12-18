import 'package:smart_cooking/models/project_model.dart';

class UserDonationHistoryProjectModel {
  ProjectModel project;
  double userDonationsAmount;

  UserDonationHistoryProjectModel(this.userDonationsAmount, this.project);

  factory UserDonationHistoryProjectModel.fromJson(Map<String, dynamic> json) {
    return UserDonationHistoryProjectModel(
        json["user_donations_amount"], ProjectModel.fromJson(json['project']));
  }
}
