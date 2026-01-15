import 'dart:math';

import 'package:flutter/material.dart';

class NeonAiLoader extends StatefulWidget {
  const NeonAiLoader({super.key});

  @override
  State<NeonAiLoader> createState() => _NeonAiLoaderState();
}

class _NeonAiLoaderState extends State<NeonAiLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeonRingPainter(controller),
      size: const Size(160, 160),
    );
  }
}

class NeonRingPainter extends CustomPainter {
  final Animation<double> animation;

  NeonRingPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2.2;

    final pulse = sin(animation.value * 2 * pi) * 4;

    final ringPaint = Paint()
      ..color = const Color(0xFF00E676)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    canvas.drawCircle(center, radius + pulse, ringPaint);

    final particlePaint = Paint()..color = const Color(0x6600E676);

    for (int i = 0; i < 30; i++) {
      final angle = (i / 30) * 2 * pi;
      final offset = sin(animation.value * 2 * pi + i) * 6; // in-out motion

      final x = center.dx + cos(angle) * (radius + offset);
      final y = center.dy + sin(angle) * (radius + offset);

      canvas.drawCircle(Offset(x, y), 1.6, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
