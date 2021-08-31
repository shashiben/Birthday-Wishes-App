import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/ui/views/Carousel%20View/carousel_view.dart';

class CakeController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController cakeBakeLottie = AnimationController(
    vsync: this,
  );
  late AnimationController cakeReadyLottie = AnimationController(
    vsync: this,
  );

  RxInt index = 0.obs;
  changeIndex(int value) {
    index.value = value;
  }

  actionAfterCakeBake() async {
    cakeBakeLottie.forward();
    await Future.delayed(
        Duration(seconds: cakeBakeLottie.duration?.inSeconds ?? 17));
    changeIndex(1);
  }

  actionAfterCakeReady() async {
    cakeReadyLottie.forward();
    await Future.delayed(
        Duration(seconds: cakeReadyLottie.duration?.inSeconds ?? 8));
    navigateToRate();
  }

  navigateToRate() {
    Get.to(() => CarouselView(), opaque: true);
  }

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
    index.value = 0;
    super.onClose();
  }
}
