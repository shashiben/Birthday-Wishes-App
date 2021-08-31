import 'package:get/get.dart';

class CarouselViewController extends GetxController {
  RxInt currentPage = 0.obs;
  changePageValue(int index) {
    currentPage.value = index;
  }

  final RxString title = 'Memories'.obs;
}
