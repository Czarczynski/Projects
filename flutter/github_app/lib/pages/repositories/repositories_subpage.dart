import 'package:flutter/material.dart';
import 'repo_model.dart';
import 'about.dart';
import 'owner.dart';
import 'issues.dart';
import 'commits.dart';
import 'content.dart';

class RepositoriesSubpage extends StatelessWidget {
  RepositoriesSubpage(this.element);
  final Repo element;

  @override
  Widget build(BuildContext context) {
    return _RepositoriesSubpageState(element);
  }
}

class _RepositoriesSubpageState extends StatelessWidget {
  _RepositoriesSubpageState(this.element);
  final Repo element;
  @override
  Widget build(BuildContext context4) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
                title: Text(element.path, style: TextStyle(letterSpacing: 2.0)),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "About"),
                    Tab(text: "Owner"),
                    Tab(text: "Files"),
                    Tab(text: "Issues"),
                    Tab(text: "Commits")
                  ],
                )
            ),
            body: TabBarView(
              children: [
                Scrollbar(child: About(element)),
                Scrollbar(child: Owner(element)),
                Scrollbar(child: Content(element)),
                Scrollbar(child: Issues(element)),
                Scrollbar(child: Commits(element))
              ],
            )));
  }
}
