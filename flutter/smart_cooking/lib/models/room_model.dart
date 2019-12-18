class RoomsModel {
  String floor, room, desk;

  RoomsModel(this.desk, this.floor, this.room);

  RoomsModel.empty() {
    room = "Other";
    floor = "Other";
    room = "Other";
  }

  //static get empty => RoomsModel.fromJson({"room": "Other", "floor": "", "desk": ''});

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(json['desk'], json["floor"], json["room"]);
}
