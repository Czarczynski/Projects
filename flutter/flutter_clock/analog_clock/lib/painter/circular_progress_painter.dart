import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgress extends CustomPainter {
  DateTime _currentDate;

  CircularProgress(this._currentDate);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradientSeconds = LinearGradient(colors: [Colors.white, Colors.orange]);
    var gradientMinute = LinearGradient(colors: [Colors.red, Colors.white]);
    var gradientHour = LinearGradient(colors: [Colors.white, Colors.blue]);

    Paint paintHour = Paint()
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint paintMinute = Paint()
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint paintSecond = Paint()
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint points = Paint()
      ..strokeWidth = 8
      ..color = Colors.white30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;


    paintSecond.shader = gradientSeconds.createShader(rect);
    paintMinute.shader = gradientMinute.createShader(rect);
    paintHour.shader = gradientHour.createShader(rect);

    double angle =
        2 * pi * ((_currentDate.second + _currentDate.millisecond / 100) / 60);
    double angle2 =
        2 * pi * ((_currentDate.minute + _currentDate.second / 60) / 60);
    double angle3 =
        2 * pi * (-(_currentDate.hour + _currentDate.minute / 60) / 12);

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset pointsOffset(_point, {double offset = 170.0}) =>
        center +
        Offset(sin(2 * pi * (-_point / 12)), cos(2 * pi * (-_point / 12))) *
            -offset;
    Offset hourPoint = center + Offset(sin(angle3), cos(angle3)) * -75;
    double radius = min(size.width / 2, size.height / 2) - 24;

    List<Offset> _pointsOffsetList = [
      pointsOffset(1),
      pointsOffset(2),
      pointsOffset(4),
      pointsOffset(5),
      pointsOffset(7),
      pointsOffset(8),
      pointsOffset(10),
      pointsOffset(11),
    ];

    List<Offset> _hoursOffsetList = [
      pointsOffset(0),
      pointsOffset(3),
      pointsOffset(6),
      pointsOffset(9),
    ];


    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / -2,
        angle, false, paintSecond);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 30),
        pi / -2, angle2, false, paintMinute);

    canvas.drawPoints(PointMode.points, [hourPoint], paintHour);
    canvas.drawPoints(PointMode.points, _pointsOffsetList, points);
  _hoursPaint(canvas, size, '12', _hoursOffsetList[0]+Offset(-5,0));
  _hoursPaint(canvas, size, '3', _hoursOffsetList[1]);
  _hoursPaint(canvas, size, '6', _hoursOffsetList[2]);
  _hoursPaint(canvas, size, '9', _hoursOffsetList[3]);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  void _hoursPaint(Canvas _canvas, Size _size, String _text, Offset _offset){
    final textStyle = TextStyle(
      color: Colors.white70,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: _text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: _size.width,
    );
    return textPainter.paint(_canvas, _offset+Offset(-10,-20));
  }
}


