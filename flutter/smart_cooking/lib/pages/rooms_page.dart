import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/employees_bloc.dart';
import 'package:smart_cooking/models/employee_detail_model.dart';
import 'package:smart_cooking/models/room_model.dart';
import 'package:smart_cooking/pages/DrawerPage.dart';
import 'package:smart_cooking/pages/rooms_and_employees_search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rooms extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeesBloc>(
      builder: (context) => EmployeesBloc(context),
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
              title: Container(
                  height: 26,
                  width: 204,
                  child: Text(EngStrings.ROOMS,
                      style: Theme.of(context).textTheme.title)),
              actions: [
                Consumer<EmployeesBloc>(builder: (context, _bloc, _) {
                  return InkWell(
                    key: Key('searchEmployeeKey'),
                    onTap: () {
                      return showSearch(
                          context: context,
                          delegate: RoomsEmployeesSearch(
                              _bloc.employeesList, _bloc.roomList));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16.0),
                      child: Icon(
                        Icons.search,
                        color: ThemeConfig.PURPLE_,
                      ),
                    ),
                  );
                }),
              ],
              leading: IconButton(
                  icon: Icon(Icons.toc),
                  color: Color.fromRGBO(94, 53, 177, 1),
                  onPressed: () => _scaffoldKey.currentState.openDrawer())),
          drawer: DrawerPage(CurrentDrawerPage.ROOMS_PAGE),
          body: _RoomsState()),
    );
  }
}

class _RoomsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeesBloc>(builder: (context, _bloc, _) {
      final List<EmployeeDetailModel> _employeesList = _bloc.employeesList;
      final List<RoomsModel> _rooms = _bloc.roomList;
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          key: Key('RoomsList'),
          itemCount: _rooms.length,
          itemBuilder: (context, int index) {
            var _oneRoom = _rooms[index];
            List<EmployeeDetailModel> _employees = _employeesList.where((item) {
              return item.workplace.room == _oneRoom.room;
            }).toList();
            return Container(
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
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
                    left: 24, top: 18, bottom: 10, right: 24),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        children: <Widget>[
                          Text(
                              (_oneRoom.floor != "Other")
                                  ? "Floor ${_oneRoom.floor} / ${_oneRoom.room}"
                                  : _oneRoom.room,
                              style: Theme.of(context).textTheme.display1),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Column(
                          children: _employees
                              .map(
                                (_oneEmployee) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child:
                                            Icon(Icons.brightness_1, size: 14),
                                      ),
                                      Flexible(
                                        child: Text("${_oneEmployee.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1
                                                .copyWith(fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
