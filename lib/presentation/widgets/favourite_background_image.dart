import 'package:flutter/material.dart';

class FavouriteBackgroundImage extends StatelessWidget {
  const FavouriteBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(),
      child: Container(),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff04b3621)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
