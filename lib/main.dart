import './componentes/CoordenadasPainter.dart';
import './componentes/CoordenadasRelativas.dart';
import './componentes/GradeCoordenadas.dart';
import './componentes/OffSet.dart';
import './componentes/Onda.dart';
import './componentes/RectExample.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPainter Examples',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CustomPainter Examples'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Coordenadas'),
              Tab(text: 'Grade'),
              Tab(text: 'Offset'),
              Tab(text: 'Rect'),
              Tab(text: 'Relativas'),
              Tab(text: 'Onda'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPainterScreen(CoordenadasPainter()),
            _buildPainterScreen(GradeCoordenadas()),
            _buildPainterScreen(OffsetExample()),
            _buildPainterScreen(RectExample()),
            _buildPainterScreen(CoordenadasRelativas()),
            Onda(),
          ],
        ),
      ),
    );
  }

  Widget _buildPainterScreen(CustomPainter painter) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: CustomPaint(painter: painter),
      ),
    );
  }
}