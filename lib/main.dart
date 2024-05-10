
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_paint/view/Home_Page.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) =>
      GetMaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        "/":(p0) => Home_Page()
      },
    ),)
  );
}