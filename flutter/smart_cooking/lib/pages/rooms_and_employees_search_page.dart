import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/rooms_employees_search_bloc.dart';
import 'package:smart_cooking/models/employee_detail_model.dart';
import 'package:smart_cooking/models/room_model.dart';
import 'package:smart_cooking/pages/no_results.dart';
import 'package:flutter/material.dart';

class RoomsEmployeesSearch extends SearchDelegate {
  List<EmployeeDetailModel> _employeesModel;
  List<RoomsModel> _roomsList;

  RoomsEmployeesSearch(this._employeesModel, this._roomsList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme,
      primaryColor: theme.backgroundColor,
      primaryIconTheme: theme.iconTheme,
      iconTheme: theme.iconTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchEmployees(query, _employeesModel, _roomsList, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchEmployees(query, _employeesModel, _roomsList, context);
  }
}

// ignore: must_be_immutable
class _SearchEmployees extends StatelessWidget {
  final List<EmployeeDetailModel> _employeesModel;
  final List<RoomsModel> _roomsList;
  final String query;
  RoomsEmployeesSearchBloc _searchBloc;

  _SearchEmployees(
      this.query, this._employeesModel, this._roomsList, BuildContext context) {
    _searchBloc = RoomsEmployeesSearchBloc(_employeesModel, context);
  }

  List<TextSpan> _getSpans(String text, String matchWord) {
    List<TextSpan> spans = [];
    int index = 0;

    if (matchWord == '') {
      spans.add(TextSpan(text: text));
      return spans;
    } else {
      while (index < text.length) {
        if (index == text.toLowerCase().indexOf(matchWord.toLowerCase()) ||
            index == text.toUpperCase().indexOf(matchWord.toUpperCase()) ||
            index == text.indexOf(matchWord)) {
          spans.add(TextSpan(
              text: text.substring(index, index + matchWord.length),
              style: TextStyle(color: Colors.red)));
          text = text.substring(index + matchWord.length);
          index = 0;
        } else {
          spans.add(TextSpan(text: text[index]));
          index++;
        }
      }
      return spans;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (query.trim() == '')
      return Container(
        color: ThemeConfig.WHITE_SMOKE,
        child: Center(
          child: Text(EngStrings.SEARCH,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: ThemeConfig.BLUE_LIGHT_GRAY)),
        ),
      );
    else {
      return StreamBuilder<List<EmployeeDetailModel>>(
        stream: _searchBloc.getSearchResultsStream(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return NoResults();
            }
            final _employeesList = snapshot.data;
            return Container(
              color: ThemeConfig.WHITE_SMOKE,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: _employeesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var _oneEmployee = _employeesList[index];
                      List<RoomsModel> _oneRoom = _roomsList.where((_room) {
                        return _room.desk == _oneEmployee.workplace.desk;
                      }).toList();
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: ThemeConfig.BLUE_CYAN,
                                  spreadRadius: 0,
                                  blurRadius: 20)
                            ]),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24, top: 18, bottom: 18, right: 24),
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: RichText(
                                          text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .display1
                                                  .copyWith(fontSize: 20),
                                              children: _getSpans(
                                                  _oneEmployee.name, query))),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text((_oneRoom[0].floor != "Other")
                                      ? "Floor ${_oneRoom[0].floor} / ${_oneRoom[0].room}"
                                      : _oneRoom[0].room),
                                ],
                              )
                            ])),
                      );
                    }),
              ),
            );
          } else if (snapshot.hasError) {
            throw Exception(snapshot.error);
          }
          return Container(
            color: ThemeConfig.WHITE_SMOKE,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    }
  }
}
