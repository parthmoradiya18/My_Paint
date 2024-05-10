import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_paint/Custom/Custompaint.dart';
import 'package:my_paint/Model/Paint_Model.dart';
import 'package:my_paint/State/Getx.dart';
import 'package:sizer/sizer.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  paintcontroller controller = Get.put(paintcontroller());
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(child:  AppBar(backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title: Text(
            "My Paint",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
                fontSize: 20),
          ),
        ),preferredSize: Size(0, 5.h)),


        key: key,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              controller.points.clear();
              Customdrawing draw = Customdrawing(controller.points);
              draw.cleanData();
            });
          },
          child: Icon(Icons.close, color: Colors.white),
          backgroundColor: Colors.lightGreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      RenderBox? renderBox =
                          context.findRenderObject() as RenderBox?;
                      controller.points.add(modal(
                          Paint()
                            ..color = controller.currentcolor.value
                            ..strokeCap = StrokeCap.round
                            ..strokeWidth = controller.slider.value
                            ..isAntiAlias = true,
                          renderBox!.globalToLocal(details.globalPosition)));
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      controller.points.add(modal(Paint(), Offset.zero));
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      RenderBox? renderBox =
                          context.findRenderObject() as RenderBox?;
                      controller.points.add(modal(
                          Paint()
                            ..color = controller.currentcolor.value
                            ..strokeCap = StrokeCap.square
                            ..strokeWidth = controller.slider.value
                            ..isAntiAlias = true,
                          renderBox!.globalToLocal(details.globalPosition)));
                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 70.h,
                    child: CustomPaint(
                      painter: Customdrawing(controller.points),
                    ),
                  ),
                ),
                 Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 10.h,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.color_
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: InkWell(
                                          onTap: () {
                                            controller.currentcolor.value = e;
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: e,
                                            radius: 10,
                                          )),
                                    ))
                                .toList()),
                        Container(
                          height: 3.h,
                          width: 90.w,
                          child: Obx(
                            () => Slider(
                              min: 2,
                              activeColor: controller.currentcolor.value,
                              inactiveColor: controller.currentcolor.value,
                              max: 30,
                              value: controller.slider.value,
                              onChanged: (value) {
                                controller.slider.value = value;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
