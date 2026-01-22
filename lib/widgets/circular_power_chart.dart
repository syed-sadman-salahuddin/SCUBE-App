import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularPowerChart extends StatelessWidget {
  final String power;
  final double percentage;
  
  const CircularPowerChart({
    super.key,
    required this.power,
    this.percentage = 0.75, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: const Size(200, 200),
          painter: CircularChartPainter(percentage: percentage),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Power',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    power,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111822),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final double percentage;

  CircularChartPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final strokeWidth = 22.0;

   
    final backgroundPaint = Paint()
      ..color = const Color(0xFFD6EFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt; 

    canvas.drawCircle(center, radius - strokeWidth / 2, backgroundPaint);

    // Progress circle 
    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);
    
    final progressPaint = Paint()
      ..color = const Color(0xFF0095FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -math.pi / 2, 
      2 * math.pi * percentage, 
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularChartPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
