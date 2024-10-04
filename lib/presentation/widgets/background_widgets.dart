import 'package:flutter/material.dart';

class FirstBackgroundWidget extends StatelessWidget {
  const FirstBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BottomTrianglePainter(),
      child: Container(),
    );
  }
}

class SecondBackgroundWidget extends StatelessWidget {
  const SecondBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: UpperTrianglePainter(),
      child: Container(),
    );
  }
}

class BottomTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff04b3621) 
      ..style = PaintingStyle.fill; 

    final path = Path()
      ..moveTo(0, size.height) 
      ..lineTo(size.width, 0) 
      ..lineTo(size.width, size.height) 
      ..close(); 

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; 
  }
}

class UpperTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff2e2e2e) 
      ..style = PaintingStyle.fill; 

    final path = Path()
      ..moveTo(0, 0) 
      ..lineTo(0, size.height) 
      ..lineTo(size.width, size.height) 
      ..close(); 
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; 
  }
}
