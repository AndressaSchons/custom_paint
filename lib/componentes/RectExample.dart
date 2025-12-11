import 'package:flutter/material.dart';

class RectExample extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect1 = Rect.fromLTWH(50, 50, 100, 80);
    final rect2 = Rect.fromPoints(Offset(200, 50), Offset(300, 130));
    final rect3 = Rect.fromCircle(center: Offset(175, 250), radius: 50);

    canvas.drawRect(rect1, paint);
    canvas.drawRect(rect2, paint..color = Colors.green);
    canvas.drawRect(rect3, paint..color = Colors.orange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}