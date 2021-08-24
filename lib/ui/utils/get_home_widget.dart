import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/ui/views/Home%20View/ballon_view.dart';
import 'package:suprise/ui/views/Home%20View/initial_view.dart';

import 'home_utils.dart';

Widget getWidget(int index, bool isLottieLoaded) {
  return AnimatedContainer(
    curve: Curves.easeInToLinear,
    duration: Duration(seconds: 2),
    width: Get.width,
    height: Get.height,
    decoration: BoxDecoration(
        gradient: !isLottieLoaded
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
      return Container(
        child: InitialHomeView(index: index),
      );
    case 1:
      return BallonView();
    default:
      return SizedBox();
  }
}
