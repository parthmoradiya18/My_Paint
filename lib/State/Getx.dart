

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_paint/Model/Paint_Model.dart';



class paintcontroller extends GetxController {

  var pickcolor = Color(0xff000000).obs;

  RxDouble slider = 3.0.obs;

  var currentcolor = Color(0xff000000).obs;

  RxList<modal> points = <modal>[].obs;

  List<Color> color_ = [
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.yellow,
    Colors.purpleAccent,
    Colors.amber,
    Colors.purple,
    Colors.indigo,
    Colors.lightGreen,

  ];
}
