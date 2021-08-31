import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/ui/views/Cake%20View/cake_screen.dart';

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
  final RxString title = 'Click on bulb'.obs;
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
    title.value = "Turning on lights...";
    lightBulbLottieController.forward();
    await Future.delayed(
        Duration(milliseconds: lightBulbLottieController.duration!.inSeconds));
    title.value = "";
    isBulbLottieLoaded.value = true;
    await Future.delayed(Duration(seconds: 2));
    changeIndex(1);
  }

  RxBool showNextButton = false.obs;
  showButton() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      showNextButton.value = true;
    });
  }

  navigateToNext() {
    Get.to(() => CakeScreen());
  }
}
