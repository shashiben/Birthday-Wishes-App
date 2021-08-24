import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/core/controllers/cake_controller.dart';

class CakeReadyView extends GetView<CakeController> {
  const CakeReadyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFa44a70),
      child: Center(
        child: Lottie.asset('assets/lottie/cake_ready.json',
            alignment: Alignment.center,
            repeat: false,
            controller: controller.cakeReadyLottie, onLoaded: (composition) {
          controller.cakeReadyLottie.duration = composition.duration;
          print("Duration is:${composition.duration}");
          controller.actionAfterCakeReady();
        }),
      ),
    );
  }
}
