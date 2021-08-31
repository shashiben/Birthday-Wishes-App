import 'package:get/get.dart';
import 'package:suprise/core/controllers/text_view_controller.dart';

class TextViewBindings extends Bindings {
  @override
  void dependencies() {
    printInfo(info: "Dependency Called");
    Get.put<TextViewController>(TextViewController(), permanent: true);
  }
}
