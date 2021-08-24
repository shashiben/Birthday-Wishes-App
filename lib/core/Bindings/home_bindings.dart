import 'package:get/get.dart';
import 'package:suprise/core/controllers/cake_controller.dart';
import 'package:suprise/core/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    printInfo(info: "Dependency Called");
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<CakeController>(CakeController(), permanent: true);
  }
}
