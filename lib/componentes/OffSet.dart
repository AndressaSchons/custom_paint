import 'package:flutter/material.dart';

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