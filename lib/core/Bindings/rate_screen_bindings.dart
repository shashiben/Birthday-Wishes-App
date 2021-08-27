import 'package:get/get.dart';
import 'package:suprise/core/controllers/rate_controller.dart';

class RateScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<RateController>(RateController(), permanent: true);
  }
}
