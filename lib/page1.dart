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

class OffsetExample extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final pontos = [
      Offset(50, 50),
      Offset(size.width - 50, 50),
      Offset(50, size.height - 50),
      Offset(size.width-200, size.height - 50),
    ];

    final path = Path()
      ..moveTo(pontos[0].dx, pontos[0].dy)
      ..lineTo(pontos[1].dx, pontos[1].dy)
      ..lineTo(pontos[3].dx, pontos[3].dy)
      ..lineTo(pontos[2].dx, pontos[2].dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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