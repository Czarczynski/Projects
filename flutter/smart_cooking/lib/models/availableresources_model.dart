class AvailableResourcesModel {
  bool canDonate;
  double resources;

  AvailableResourcesModel({this.canDonate = false, this.resources = 0});

  factory AvailableResourcesModel.fromJson(Map<String, dynamic> json) {
    return AvailableResourcesModel(
        canDonate: json["can_donate"], resources: json["available_resources"]);
  }
}
