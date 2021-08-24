import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/core/controllers/cake_controller.dart';

class CakeInitialView extends GetView<CakeController> {
  const CakeInitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFc1e6f0),
      child: Center(
        child: Lottie.asset('assets/lottie/cake_baking.json',
            alignment: Alignment.center,
            repeat: false,
            controller: controller.cakeBakeLottie, onLoaded: (composition) {
          controller.cakeBakeLottie.duration = composition.duration;
          controller.actionAfterCakeBake();
        }),
      ),
    );
  }
}
