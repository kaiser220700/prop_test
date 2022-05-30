import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = const Color(0xFFC1C1C1)
    ..strokeWidth = 2;
    var max = 370;
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
