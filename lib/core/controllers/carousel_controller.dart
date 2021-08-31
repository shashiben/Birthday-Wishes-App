import 'package:get/get.dart';

class CarouselViewController extends GetxController {
  RxInt currentPage = 0.obs;
  changePageValue(int index) {
    currentPage.value = index;
  }

  List images = [
    "https://images.unsplash.com/photo-1610878180933-123728745d22?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1617803672592-177dbdb3abfa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1596523444770-74d0b801ee46?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FuYWRhJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60",
    "https://images.unsplash.com/photo-1596525728348-7b13f6e6d7a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1181&q=80"
  ];

  final RxString title = 'Memories'.obs;
}
