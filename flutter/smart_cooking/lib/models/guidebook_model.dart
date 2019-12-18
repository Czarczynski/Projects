class GuideBookModel {
  final int id;
  final String name, description, photo;
  bool visibility = false, status;
  final bool owning;

  GuideBookModel(this.id, this.name, this.status, this.owning, this.description, this.photo);

  changeVisibility() {
    visibility = !visibility;
  }

  factory GuideBookModel.fromJson(Map<String, dynamic> json) {
    return GuideBookModel(json['id'], json['title'], json['status'], json['owning'], json['description'], json['photo']);
  }
}
