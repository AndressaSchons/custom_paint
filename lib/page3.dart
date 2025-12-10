import 'dart:math';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(title: const Text('Onda horizontal 🌊')),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: _changeColor,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _MyAnimatedPainter(
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

class _MyAnimatedPainter extends CustomPainter {
  final double t;
  final Color waveColor;

  _MyAnimatedPainter(this.t, this.waveColor);

  @override
  void paint(Canvas canvas, Size size) {
    // fundo
    final paintBackground = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paintBackground);

    // gradiente da onda
    final paintWave = Paint()
      ..shader = LinearGradient(
        colors: [waveColor, waveColor.withOpacity(0.7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();

    // movimento horizontal (vai e volta)
    final waveX = sin(t * 2 * pi) * 80; // amplitude horizontal

    // forma da onda horizontal
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(
      size.width * 0.3 + waveX, // ponto de controle se move no eixo X
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.5,
    );

    path.quadraticBezierTo(
      size.width * 0.7 - waveX, // segundo controle invertido
      size.height * 0.7,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paintWave);
  }

  @override
  bool shouldRepaint(covariant _MyAnimatedPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.waveColor != waveColor;
}
