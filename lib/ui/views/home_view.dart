import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/home_controller.dart';
import 'package:suprise/ui/views/initial_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.index.value == 1)
            controller.changeIndex(0);
          else
            controller.changeIndex(1);
        },
      ),
      body: Obx(
        () => InitialView(index: controller.index.value),
      ),
    );
  }
}
