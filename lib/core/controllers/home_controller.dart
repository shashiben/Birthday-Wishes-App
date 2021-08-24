import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ConfettiController firstConfettiController =
      ConfettiController(duration: const Duration(seconds: 10));

  late ConfettiController secondConfettiController =
      ConfettiController(duration: const Duration(seconds: 10));
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

  void changeIndex(int value) async {
    index.value = value;
    if (value == 1) {
      await Future.delayed(Duration(seconds: 6));
      firstConfettiController.play();
      secondConfettiController.play();
    }
  }
}
