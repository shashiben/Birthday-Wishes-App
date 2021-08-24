import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/ui/views/ballon_view.dart';

import 'home_utils.dart';

Widget getWidget(int index) {
  return AnimatedContainer(
    curve: Curves.easeInToLinear,
    duration: Duration(seconds: 1),
    width: Get.width,
    height: Get.height,
    decoration: BoxDecoration(
        gradient: index == 0
            ? LinearGradient(
                colors: HomeUtils.darkGradient,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)
            : LinearGradient(
                colors: [Colors.white, Colors.white70, Colors.white60])),
    child: getChild(index),
  );
}

Widget getChild(int index) {
  switch (index) {
    case 0:
      return SizedBox();
    case 1:
      return BallonView();
    default:
      return SizedBox();
  }
}
