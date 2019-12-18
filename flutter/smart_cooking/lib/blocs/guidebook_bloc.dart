import 'dart:async';
//import 'dart:convert';
//
import 'package:smart_cooking/models/guidebook_model.dart';
import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;



class GuidebookBloc extends ChangeNotifier {
  List<GuideBookModel> post = [];

  GuidebookBloc() {
    _fetchData().then((items) {
      if (items.isNotEmpty) this.post = items;
      notifyListeners();
    });
  }

  changeVisibility(GuideBookModel element) {
    element.changeVisibility();
    notifyListeners();
  }

  changeState(GuideBookModel _element) {
    _element.status = !_element.status;
    notifyListeners();
  }

  bool get isInProgress => _isInProgress;

  bool _isInProgress = true;

  Future<List<GuideBookModel>> _fetchData() async {
//    final response =
//        await http.get('https://jsonplaceholder.typicode.com/albums');
     this._isInProgress = false;
//    if (response.statusCode == 200) {
//      return (json.decode(response.body) as List)
//          .map((item) => GuideBookModel.fromJson(item))
//          .toList();
//    } else {
//      throw Exception('Failed to load Guidebooks');
//    }
  return [
    GuideBookModel(1, "Lodówka", true, true, "Nasza super inteligentna lodówka nofrost", "assets/images/urzadzenia/lodowka.jpg"),
    GuideBookModel(2, "Garnki", true, true, "Zestaw naszych garnków z podwójnym\n dnem oraz automatycznym\n rozłączaniem płyty grzewczej", "assets/images/urzadzenia/garnki.jpg"),
    GuideBookModel(3, "Płyta grzewcza", false, true, "Pięcio palnikowa płyta indukcyjna\n NIC NIE PRZYPALISZ", "assets/images/urzadzenia/indukcja.jpg"),
    GuideBookModel(4, "Ekspres", false, true, "opisik", ""),
    GuideBookModel(5, "Czajnik", false, true, "opisik", ""),
    GuideBookModel(6, "Mikrofalówka", false, true, "opisik", ""),
    GuideBookModel(7, "Zmywarka", false, true, "opisik", ""),
    GuideBookModel(8, "Piekarnik", false, true, "opisik", ""),
    GuideBookModel(9, "Multicooker", false, false, "opisik", ""),
    GuideBookModel(9, "Sokowirówka", false, false, "Przecudowna sokowirówka\n ESKTRA INTELIGENTNA", "assets/images/urzadzenia/sokowirowka.jpg"),
    GuideBookModel(9, "Sztućce", false, false, "opisik", ""),
    GuideBookModel(9, "Miarki", false, false, "opisik", ""),

  ];
  }
}
