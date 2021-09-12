import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselViewController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;
  RxDouble offset = 0.0.obs;
  changePageValue(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      offset.value = pageController.page!;
    });
  }

  List<String> imagesList = [
    "https://images.unsplash.com/photo-1610878180933-123728745d22?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1617803672592-177dbdb3abfa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1610878180933-123728745d22?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1617803672592-177dbdb3abfa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
  ];
  List<String> titles = [
    "Lorem Ispum Is Daito",
    "Lorem Ispum Is Daito",
    "Lorem Ispum Is Daito",
    "Lorem Ispum Is Daito",
  ];
  List<String> description = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
  ];

  final RxString title = 'Memories'.obs;
}
