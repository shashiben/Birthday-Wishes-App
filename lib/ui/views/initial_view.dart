import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/core/controllers/home_controller.dart';

class InitialView extends GetView<HomeController> {
  final int index;
  const InitialView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: GestureDetector(
        onTap: controller.startBulbLottieAnimation,
        child: Lottie.asset('assets/lottie/bulb.json',
            repeat: false, controller: controller.lightBulbLottieController,
            onLoaded: (composition) {
          controller.lightBulbLottieController.duration = composition.duration;
        }),
      ),
    ));
  }
}
