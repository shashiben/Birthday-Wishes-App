import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CakeScreen extends GetView {
  const CakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
