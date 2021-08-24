import 'package:get/get.dart';
import 'package:suprise/core/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    printInfo(info: "Dependency Called");
    Get.put<HomeController>(HomeController(), permanent: true);
    // Get.lazyPut<AnimationController>(
    //   () => AnimationController(vsync: null),
    // );
  }
}
