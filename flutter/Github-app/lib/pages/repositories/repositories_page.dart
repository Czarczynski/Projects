import 'package:flutter/material.dart';

class RepositoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositories"),
      ),
      body: _RepositoriesPageWidget(),
    );
  }
}

class _RepositoriesPageWidget extends StatefulWidget {
  @override
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<_RepositoriesPageWidget> {
  @override
  Widget build(BuildContext context) {
    // TOOD

    return Container();
  }
}
