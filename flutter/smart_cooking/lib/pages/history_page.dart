import 'package:flutter/material.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/history_list.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  final String lastVisited;

  HistoryPage(this.lastVisited);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          EnglishVer.HISTORY,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: DrawerPage(CurrentDrawerPage.HISTORY_PAGE),
      body: HistoryList(context, lastVisited, true),
    );
  }
}
