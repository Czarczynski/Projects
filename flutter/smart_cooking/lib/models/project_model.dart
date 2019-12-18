class ProjectModel {
  String title, description, photo;
  int id, budget, amount;
  double budgetDouble, amountDouble;
  bool completed;
  bool paid = false;

  checkCompleted() {
    completed = amount >= budget;
  }

  ProjectModel(
      {this.id,
      this.title,
      this.description,
      this.amountDouble,
      this.budgetDouble,
      this.photo}) {
    amount = amountDouble.toInt();
    budget = budgetDouble.toInt();
    checkCompleted();
  }

  @override
  bool operator ==(covariant ProjectModel other) =>
      other is ProjectModel && other.id == id && other.title == title;

  int get hashCode => id.hashCode ^ title.hashCode;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['asana_id'],
      title: json['title'],
      description: json['description'],
      amountDouble: json['amount'],
      budgetDouble: json['budget'],
    );
  }
}
