import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/cake_controller.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/utils/get_cake_widget.dart';

class CakeScreen extends GetView<CakeController> {
  const CakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: controller.showBlowFloatButton.value
            ? FadeAnimation(
                delay: 1,
                xDistance: 0,
                yDistance: 50,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      controller.resumeCakeBlowAction();
                    },
                    label: Text(
                      "Blow Candles",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              )
            : SizedBox(),
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
