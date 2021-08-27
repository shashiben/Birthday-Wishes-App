import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/rate_controller.dart';

class RateView extends GetView<RateController> {
  const RateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.children.toList(),
            ),
          ),
        ),
      ),
    );
  }
}
