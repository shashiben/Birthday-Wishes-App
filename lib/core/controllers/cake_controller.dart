import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CakeController extends GetxController with SingleGetTickerProviderMixin {
  late final AnimationController cakeBakeLottie =
      AnimationController(vsync: this);

  actionAfterCakeBake() async {
    
  }
}
