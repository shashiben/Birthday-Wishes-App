import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/carousel_controller.dart';

class CarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CarouselViewController>();
    return Obx(
      () => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        controller.images[controller.currentPage.value]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.65,
              child: PageView.builder(
                itemCount: 5,
                onPageChanged: (int page) {
                  controller.changePageValue(page);
                },
                itemBuilder: (BuildContext context, int index) {
                  return FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.images[index]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: Text(controller.title.value + "${controller.currentPage}"),
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
