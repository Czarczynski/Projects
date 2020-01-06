import 'dart:async';

import 'circular_progress_painter.dart';
import 'package:flutter/material.dart';

class CircularProgressWidget extends StatefulWidget {
  final int _amount, _budget;

  CircularProgressWidget(this._amount, this._budget);

  @override
  _CircularProgressWidgetState createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with TickerProviderStateMixin {
  AnimationController _progressController;
  var _now = DateTime.now();
  Timer _timer;

  get _initAnimationEnd => widget._amount / widget._budget * 100;

  @override
  void didUpdateWidget(CircularProgressWidget oldWidget) {
    drawNewCircle(
        (widget._amount - 40) / widget._budget * 100, _initAnimationEnd, 0);
    super.didUpdateWidget(oldWidget);
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    drawNewCircle(0, _initAnimationEnd, 100);
    _updateTime();
  }

  drawNewCircle(double begin, double end, int delayduration) {
    _progressController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    Future.delayed(Duration(milliseconds: delayduration),
        () => _progressController.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: Center(
        child: CustomPaint(
          foregroundPainter: CircularProgress(_now),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "${_now.hour < 10 ? '0${_now.hour}' : _now.hour}:${_now.minute < 10 ? '0${_now.minute}' : _now.minute}:${_now.second < 10 ? '0${_now.second}' : _now.second}",
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
