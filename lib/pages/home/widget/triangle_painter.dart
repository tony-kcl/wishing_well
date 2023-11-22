import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final bool isLeft;
  TrianglePainter({this.isLeft = false});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    if (isLeft) {
      return Path()
        ..moveTo(x, 0)
        ..lineTo(x, y)
        ..lineTo(x / 2, y / 2)
        ..lineTo(x, 0);
    } else {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(0, y)
        ..lineTo(x / 2, y / 2)
        ..lineTo(0, 0);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}