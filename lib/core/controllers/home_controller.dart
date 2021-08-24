import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  final String title = 'Home View';
  @override
  void onReady() {
    print("ready home");
    super.onReady();
  }

  @override
  void onInit() {
    print("init home");
    super.onInit();
  }

  @override
  void onClose() {
    print("close home");
    super.onClose();
  }

  void changeIndex(int value) {
    index.value = value;
  }
}
