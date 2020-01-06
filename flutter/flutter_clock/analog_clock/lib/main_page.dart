import 'package:flutter/material.dart';
import 'painter/circular_progress_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: CircularProgressWidget(348, 360),
    );
  }
}
