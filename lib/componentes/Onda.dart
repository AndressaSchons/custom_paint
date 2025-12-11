import 'dart:math';
import 'package:flutter/material.dart';

class Onda extends StatefulWidget {
  const Onda({super.key});

  @override
  State<Onda> createState() => _OndaState();
}

class _OndaState extends State<Onda> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color _waveColor = Colors.green;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  void _changeColor() {
    setState(() {
      _waveColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: _changeColor,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _MinhaOndaPainter(
                _controller.value,
                _waveColor,
              ),
              size: Size(size.width, size.height),
            );
          },
        ),
      ),
    );
  }
}

class _MinhaOndaPainter extends CustomPainter {
  final double t;
  final Color waveColor;

  _MinhaOndaPainter(this.t, this.waveColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, paintBackground);

    final paintWave = Paint()
      ..shader = LinearGradient(
        colors: [waveColor, waveColor.withOpacity(0.7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveX = sin(t * 2 * pi) * 80;

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(
      size.width * 0.3 + waveX,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.5,
    );

    path.quadraticBezierTo(
      size.width * 0.7 - waveX,
      size.height * 0.7,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paintWave);
  }

  @override
  bool shouldRepaint(covariant _MinhaOndaPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.waveColor != waveColor;
}