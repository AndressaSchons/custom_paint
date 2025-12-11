import 'package:flutter/material.dart';

class CoordenadasRelativas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pontos = [
      Offset(size.width * 0.9, size.height * 0.2),
      Offset(size.width * 0.4, size.height * 0.4),
      Offset(size.width * 1.0, size.height * 0.9),
    ];

    final paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(pontos[0].dx, pontos[0].dy)
      ..lineTo(pontos[1].dx, pontos[1].dy)
      ..lineTo(pontos[2].dx, pontos[2].dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}