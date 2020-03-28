import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/history_list.dart';

// ignore: must_be_immutable
class StarredPage extends StatelessWidget {
  final String starred;

  StarredPage(this.starred);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          EngStrings.STARRED,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: DrawerPage(CurrentDrawerPage.SAVED_PAGE),
      body: HistoryList(context, starred, false),
    );
  }
}
