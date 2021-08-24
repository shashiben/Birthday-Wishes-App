import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/home_controller.dart';
import 'package:suprise/ui/utils/get_home_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => controller.index.value == 0
            ? FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                label: Text("Start Event"),
                onPressed: () {
                  if (controller.index.value == 1)
                    controller.changeIndex(0);
                  else
                    controller.changeIndex(1);
                },
              )
            : SizedBox(),
      ),
      body: Obx(() => getWidget(controller.index.value)),
    );
  }
}
