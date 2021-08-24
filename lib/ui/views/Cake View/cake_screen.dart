import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/cake_controller.dart';
import 'package:suprise/ui/utils/get_cake_widget.dart';

class CakeScreen extends GetView<CakeController> {
  const CakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: getCakeWidget(controller.index.value),
        ),
      ),
    );
  }
}
