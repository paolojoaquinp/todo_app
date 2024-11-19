import 'package:flutter/material.dart';

class ScheduleLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 20, 18, 18)
      ..strokeWidth = 1.0;

    // Draw horizontal lines
    for (var y = 100.0; y <= size.height - 100; y += 50) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}