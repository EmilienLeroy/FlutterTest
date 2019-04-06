import 'package:flutter/material.dart';

class BackgroundShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the paint color to be white
    paint.color = Colors.orange;

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

    paint.color = Colors.white;

    // create a path
    var path = Path();
    double height = 100;
    path.lineTo(0.0, height);

    var firstControlPoint = Offset(size.width / 4, height);
    var firstEndPoint = Offset(size.width / 2.25, height - 10.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), height - 45);
    var secondEndPoint = Offset(size.width, height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width,  height );
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}