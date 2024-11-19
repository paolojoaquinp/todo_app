import 'package:flutter/material.dart';

class ScheduleLinePainter extends CustomPainter {
  const ScheduleLinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 10.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2), 
        paint,
      );
      startX += dashWidth + dashSpace; // Avanza al siguiente segmento
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}