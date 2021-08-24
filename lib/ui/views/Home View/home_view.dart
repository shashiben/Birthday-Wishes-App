import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/home_controller.dart';
import 'package:suprise/ui/utils/get_home_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text(controller.title.value),
          ),
          body: getWidget(
              controller.index.value, controller.isBulbLottieLoaded.value)),
    );
  }
}
