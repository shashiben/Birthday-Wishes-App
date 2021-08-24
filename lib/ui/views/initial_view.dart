import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/ui/utils/home_utils.dart';

class InitialView extends StatelessWidget {
  final int index;
  const InitialView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
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
      ),
    );
  }
}
