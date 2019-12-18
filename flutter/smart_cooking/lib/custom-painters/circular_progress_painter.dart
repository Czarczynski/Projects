import 'dart:math';

import 'package:smart_cooking/app_config.dart';
import 'package:flutter/material.dart';

class CircularProgress extends CustomPainter {
  double _currentProgress;
  bool _completed;

  CircularProgress(this._currentProgress, this._completed);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient =
        LinearGradient(colors: [Color(0xFF84C7FF), Color(0xFF3116C2)]);
    var gradientComplete = LinearGradient(colors: [Color(0xFF00FF00), Color(0xFF2228B11)]);
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = ThemeConfig.WHITE_SMOKE
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _completed == true
        ? completeArc.shader = gradientComplete.createShader(rect)
        : completeArc.shader = gradient.createShader(rect);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 24;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (_currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
