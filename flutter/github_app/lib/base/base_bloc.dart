import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose() {}
}

abstract class BaseWidgetState<T extends StatefulWidget, R extends BaseBloc> extends State<T> {
  R bloc;

  R createBloc();

  @override
  void initState() {
    super.initState();
    bloc = createBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
