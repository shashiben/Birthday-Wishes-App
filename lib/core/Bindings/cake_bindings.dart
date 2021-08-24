import 'package:get/get.dart';
import 'package:suprise/core/controllers/cake_controller.dart';

class CakeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CakeController>(CakeController(), permanent: false);
  }
}
