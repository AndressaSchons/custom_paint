import 'package:flutter/material.dart';

import 'page1.dart';
import 'package:custom_paint/page2.dart';

class HomeScreen extends StatelessWidget {
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
