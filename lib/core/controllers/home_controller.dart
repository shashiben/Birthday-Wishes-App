import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late final AnimationController cakeCardLottieController =
      AnimationController(vsync: this);
  late final AnimationController lightBulbLottieController =
      AnimationController(vsync: this);

  late ConfettiController firstConfettiController =
      ConfettiController(duration: const Duration(seconds: 4));

  late ConfettiController secondConfettiController =
      ConfettiController(duration: const Duration(seconds: 4));
  RxInt index = 0.obs;
  RxBool isBulbLottieLoaded = false.obs;
  final String title = 'Home View';
  @override
  void onReady() {
    print("ready home");
    super.onReady();
  }

  @override
  void onInit() {
    print("init home");
    super.onInit();
  }

  @override
  void onClose() {
    print("close home");
    super.onClose();
  }

  void changeIndex(int value) async {
    index.value = value;
    if (value == 1) {
      await Future.delayed(Duration(seconds: 6));
      firstConfettiController.play();
      secondConfettiController.play();
      await Future.delayed(Duration(seconds: 7));
      cakeCardLottieController.forward();
    }
  }

  startBulbLottieAnimation() async {
    lightBulbLottieController.forward();
    await Future.delayed(Duration(milliseconds: 2500));
    isBulbLottieLoaded.value = true;
    await Future.delayed(Duration(seconds: 2));
    changeIndex(1);
  }
}
