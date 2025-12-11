import 'package:flutter/material.dart';

class GradeCoordenadas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2.0;

    for (double y = 0; y <= size.height; y += 20) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (double x = 0; x <= size.width; x += 20) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    final marcadorPaint = Paint()..color = Colors.red..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), 6, marcadorPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 6, marcadorPaint);
    canvas.drawCircle(Offset(size.width, size.height), 6, marcadorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}