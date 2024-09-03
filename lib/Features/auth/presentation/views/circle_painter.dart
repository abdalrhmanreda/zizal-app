import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final innerPaint = Paint()
      ..color = Colors.red.withOpacity(.2)
      ..style = PaintingStyle.fill;

    // Top right circle
    final topRightCenter = Offset(size.width - 50, 50);
    const topRightInnerRadius = 100.0;

    canvas.drawCircle(topRightCenter, topRightInnerRadius, innerPaint);

    // Bottom left circle
    final bottomLeftCenter = Offset(50, size.height);
    const bottomLeftInnerRadius = 100.0;

    canvas.drawCircle(bottomLeftCenter, bottomLeftInnerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Top right shape with wavy line
    Path topRightPath = Path();
    topRightPath.moveTo(size.width, 0);
    topRightPath.lineTo(size.width, size.height * 0.2);
    topRightPath.cubicTo(
      size.width * 0.75,
      size.height * 0.25,
      size.width * 0.75,
      size.height * 0.45,
      size.width,
      size.height * 0.5,
    );
    topRightPath.lineTo(size.width, size.height);
    topRightPath.lineTo(size.width * 0.5, size.height);
    topRightPath.cubicTo(
      size.width * 0.6,
      size.height * 0.75,
      size.width * 0.4,
      size.height * 0.75,
      size.width * 0.5,
      size.height * 0.5,
    );
    topRightPath.lineTo(size.width * 0.1, 0);
    topRightPath.close();
    canvas.drawPath(topRightPath, paint);

    // Bottom left shape with wavy line
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopRightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red.withOpacity(.2)
      ..style = PaintingStyle.fill;

    // Define the points for the custom shape
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..quadraticBezierTo(
        size.width * 0.9,
        size.height * 0.2,
        size.width * 0.7,
        .1,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ContainerWavePainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      30,
      size.height,
      size.width / 6,
      size.height - 30,
    );
    path.quadraticBezierTo(
      size.width / 3,
      size.height / 2,
      size.width / 1.5,
      size.height - 60,
    );
    path.quadraticBezierTo(
      size.width / 1.2,
      size.height - 20,
      size.width,
      size.height / 2,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = Colors.red.withOpacity(.2)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9919375, size.height * 0.0042200);
    path_0.lineTo(size.width * 0.6915000, size.height * 0.0062400);
    path_0.quadraticBezierTo(size.width * 0.5894375, size.height * 0.0147600,
        size.width * 0.5571250, size.height * 0.1076400);
    path_0.quadraticBezierTo(size.width * 0.7349875, size.height * 0.1709000,
        size.width * 0.6446625, size.height * 0.3999800);
    path_0.quadraticBezierTo(size.width * 0.6641250, size.height * 0.3596400,
        size.width * 0.7509625, size.height * 0.3677000);
    path_0.quadraticBezierTo(size.width * 0.8097000, size.height * 0.3987400,
        size.width * 0.8582125, size.height * 0.4841000);
    path_0.quadraticBezierTo(size.width * 0.9123750, size.height * 0.3910200,
        size.width * 0.9515750, size.height * 0.4373200);
    path_0.quadraticBezierTo(size.width * 1.0174500, size.height * 0.5115000,
        size.width * 1.0018500, size.height * 0.5957000);
    path_0.lineTo(size.width * 0.9982625, size.height * 0.5860600);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
