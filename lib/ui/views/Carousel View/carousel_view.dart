import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/carousel_controller.dart';
import 'package:suprise/ui/animations/fade_animation.dart';

class CarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<CarouselViewController>();
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: controller.currentPage.value == 3
            ? FadeAnimation(
                delay: 0.5,
                xDistance: 0,
                yDistance: 30,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                    label: Text("Go to Review")),
              )
            : SizedBox(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        controller.imagesList[controller.currentPage.value]),
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
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.imagesList.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int page) {
                controller.changePageValue(page);
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(
                      () => Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(
                            controller.imagesList[index],
                            height: size.height * 0.6,
                            alignment: Alignment(
                                -controller.offset.value.abs() +
                                    controller.currentPage.value,
                                0),
                            width: size.width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: size.height * 0.6,
                        width: size.width * 0.8,
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
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
                    ),
                    Text(
                      controller.titles.elementAt(controller.currentPage.value),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        controller.description
                            .elementAt(controller.currentPage.value),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
