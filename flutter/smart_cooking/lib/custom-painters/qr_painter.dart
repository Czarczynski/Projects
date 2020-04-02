import 'package:flutter/material.dart';

import '../app_config.dart';

class QRPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = DarkThemeConfig.WHITE;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.stroke;
    var path = Path();
    double xDistance = 10;
    double curveDistance = 20;
    double yDistance = 40;
    path.moveTo(xDistance, yDistance);
    path.lineTo(xDistance, curveDistance);
    path.quadraticBezierTo(xDistance, xDistance, curveDistance, xDistance);
    path.lineTo(yDistance, xDistance);
    path.moveTo(size.width - yDistance, xDistance);
    path.lineTo(size.width - curveDistance, xDistance);
    path.quadraticBezierTo(size.width - xDistance, xDistance,
        size.width - xDistance, curveDistance);
    path.lineTo(size.width - xDistance, yDistance);
    path.moveTo(size.width - yDistance, size.height - xDistance);
    path.lineTo(size.width - curveDistance, size.height - xDistance);
    path.quadraticBezierTo(size.width - xDistance, size.height - xDistance,
        size.width - xDistance, size.height - curveDistance);
    path.lineTo(size.width - xDistance, size.height - yDistance);
    path.moveTo(yDistance, size.height - xDistance);
    path.lineTo(curveDistance, size.height - xDistance);
    path.quadraticBezierTo(xDistance, size.height - xDistance, xDistance,
        size.height - curveDistance);
    path.lineTo(xDistance, size.height - yDistance);

    var startCenterX = Offset(0, size.height / 2);
    var endCenterX = Offset(size.width, size.height / 2);
    canvas.drawLine(startCenterX, endCenterX, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
