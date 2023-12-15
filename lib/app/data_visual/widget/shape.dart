import 'dart:math';

import 'package:flutter/material.dart';

class HexagonShape extends StatelessWidget {
  const HexagonShape({super.key, required this.subtitle, required this.value});

  final String subtitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Transform.rotate(
            angle: pi / 2,
            child: SizedBox(
              width: 280.0,
              height: 280.0,
              child: CustomPaint(painter: HexagonPainter()),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          top: value.length > 2 ? 68.0 : 38.0,
          right: 0.0,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: value.length > 2 ? 88 : 120.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 38.0,
          child: Center(
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 38.0,
                color: Colors.white,
                fontFamily: 'DF',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint paint = Paint()
      ..color = Colors.blueAccent // 选择你喜欢的颜色
      ..style = PaintingStyle.fill;

    final double centerX = width / 2;
    final double centerY = height / 2;
    final double radius = min(centerX, centerY);

    final Path path = Path();
    for (int i = 0; i < 6; i++) {
      final double angle = 2 * pi / 6 * i;
      final double x = centerX + radius * cos(angle);
      final double y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Hexagon extends StatelessWidget {
  const Hexagon({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Transform.rotate(
            angle: pi / 2,
            child: SizedBox(
              width: 280.0,
              height: 280.0,
              child: CustomPaint(painter: HexagonPainter()),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          top: value.length > 3 ? 88.0 : 76.0,
          right: 0.0,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: value.length > 3 ? 78.0 : 94.0,
                color: Colors.white,
                fontFamily: 'KT',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
