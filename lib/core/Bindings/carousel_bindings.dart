import 'package:get/get.dart';
import 'package:suprise/core/controllers/carousel_controller.dart';

class CarouselBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CarouselViewController>(CarouselViewController());
  }
}
