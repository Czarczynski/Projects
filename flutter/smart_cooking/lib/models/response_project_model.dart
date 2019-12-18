import 'package:smart_cooking/models/project_model.dart';

class ResponseProjectModel {
  List<ProjectModel> projects;
  String nextPageToken;

  ResponseProjectModel(this.projects, this.nextPageToken);

  factory ResponseProjectModel.fromJson(Map<String, dynamic> json) {
    return ResponseProjectModel(
      (json['projects'] as List)
          .map((item) => ProjectModel.fromJson(item))
          .toList(),
      json["next_page_token"],
    );
  }
}
