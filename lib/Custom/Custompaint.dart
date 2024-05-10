import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_paint/Model/Paint_Model.dart';

class Customdrawing extends CustomPainter {
  List<modal> points;

  Customdrawing(this.points);

  List<Offset> off= [];


  void cleanData()
  {
    points.clear();
    off.clear();
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < (points.length - 1); i++) {
      if (points[i] != null && points[i + 1] == null) {
        canvas.drawLine(points[i].offset, points[i + 1].offset,
            points[i].paint);
      } else if (points[i] != null && points[i + 1] != null) {
        off.clear();
        off.add(points[i].offset);
        off.add(Offset(
            points[i].offset.dx + 0.1, points[i].offset.dy + 0.1));
        canvas.drawPoints(PointMode.points, off, points[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(Customdrawing oldDelegate) => oldDelegate.points!=points;

}