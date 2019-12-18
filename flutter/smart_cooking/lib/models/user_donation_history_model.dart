import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/models/user_donation_history_project_model.dart';

class UserDonationHistoryModel {
  List<UserDonationHistoryProjectModel> userDonationHistoryProjectModels = [];
  List<ProjectModel> models = [];

  UserDonationHistoryModel(this.userDonationHistoryProjectModels) {
    for (var n in userDonationHistoryProjectModels) {
      models.add(n.project);
    }
  }

  factory UserDonationHistoryModel.fromJson(Map<String, dynamic> json) {
    return UserDonationHistoryModel(
      (json['history'] as List)
          .map((item) => UserDonationHistoryProjectModel.fromJson(item))
          .toList(),
    );
  }
}
