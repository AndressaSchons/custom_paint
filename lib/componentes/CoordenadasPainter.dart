import 'dart:math';
import 'package:flutter/material.dart';

class CoordenadasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final centro = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(centro, 8, paint..color = Colors.lightBlue);
    canvas.drawCircle(Offset(0, 0), 5, paint..color = Colors.deepOrange);
    canvas.drawCircle(Offset(size.width, 0), 5, paint..color = Colors.purpleAccent);
    canvas.drawCircle(Offset(0, size.height), 5, paint..color = Colors.orange);
    canvas.drawCircle(Offset(size.width, size.height), 5, paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
