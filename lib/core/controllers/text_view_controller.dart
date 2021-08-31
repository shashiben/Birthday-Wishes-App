import 'package:get/get.dart';

class TextViewController extends GetxController
    with SingleGetTickerProviderMixin {
  @override
  void onInit() {
    super.onInit();
  }

  final RxString title = 'TextView'.obs;
}
