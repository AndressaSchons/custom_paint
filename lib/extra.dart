import 'dart:math';
import 'package:flutter/material.dart';

class Extra extends StatefulWidget {
  const Extra({super.key});

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // repete a animação de vai e volta
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onda animada 🌊')),
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MyAnimatedPainter(_controller.value),
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
          );
        },
      ),
    );
  }
}

class _MyAnimatedPainter extends CustomPainter {
  final double t; // valor da animação (0 → 1)

  _MyAnimatedPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final paintPurple = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, paintPurple);

    final paintGreen = Paint()
      ..shader = LinearGradient(
        colors: [Colors.green, Colors.lightGreenAccent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .5, 0);

    // variação no ponto de controle da curva
    final waveY = sin(t * 2 * pi) * 100; // altura da onda
    final controlY = size.height * .3 + waveY;

    path
      ..quadraticBezierTo(
        size.width * .2,
        controlY,
        size.width * .5,
        size.height * .5,
      )
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .7 - waveY / 2,
        size.width * .5,
        size.height,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.clipPath(path);
    canvas.drawRect(Offset.zero & size, paintGreen);
  }

  @override
  bool shouldRepaint(covariant _MyAnimatedPainter oldDelegate) =>
      oldDelegate.t != t;
}
