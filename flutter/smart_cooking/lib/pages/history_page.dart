import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/pages/DrawerPage.dart';
import 'package:smart_cooking/pages/history_list_page.dart';
import 'package:smart_cooking/pages/projects_list.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = ProjectBloc(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          "Historia",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: DrawerPage(CurrentDrawerPage.GUIDEBOOK_PAGE),
      body: HistoryList(context),
    );
  }
}
