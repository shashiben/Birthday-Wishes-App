import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/core/controllers/home_controller.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/widgets/animated_ballon_widget.dart';

class BallonView extends GetView<HomeController> {
  const BallonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: AnimatedBalloon()),
                    Expanded(flex: 1, child: AnimatedBalloon()),
                    Expanded(flex: 1, child: AnimatedBalloon()),
                    Expanded(flex: 1, child: AnimatedBalloon()),
                    Expanded(flex: 1, child: AnimatedBalloon()),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                child: FadeAnimation(
                    delay: 5.2,
                    xDistance: 0,
                    yDistance: -Get.width / 2,
                    yDuration: Duration(seconds: 2),
                    child: Lottie.asset('assets/lottie/cake_card.json',
                        alignment: Alignment.center,
                        controller: controller.cakeCardLottieController,
                        onLoaded: (composition) {
                      controller.cakeCardLottieController.duration =
                          composition.duration;
                    }, repeat: false)),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                child: FadeAnimation(
                    delay: 26,
                    xDistance: 0,
                    yDistance: Get.width / 2,
                    yDuration: Duration(seconds: 2),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: controller.showNextButton.value
                          ? Container(
                              margin: EdgeInsets.only(bottom: 20)
                                  .copyWith(left: 20, right: 20),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: MaterialButton(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    color: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    onPressed: controller.navigateToNext,
                                    child: Container(
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                          "Let's Bake Cake",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        )))),
                              ),
                            )
                          : AnimatedTextKit(
                              onFinished: () {
                                printInfo(
                                    info: "Animated TextKit Animation Done");
                                controller.showButton();
                              },
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'Happy Birthday\n${UserInfo.name}',
                                  textStyle: TextStyle(
                                      fontSize: 50.0, fontFamily: 'Horizon'),
                                  textAlign: TextAlign.center,
                                  speed: Duration(seconds: 001),
                                  colors: [
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.yellow,
                                    Colors.red,
                                  ],
                                ),
                              ],
                            ),
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: Get.height * 0.4,
                  child: ConfettiWidget(
                    confettiController: controller.firstConfettiController,
                    blastDirection: 0,
                    emissionFrequency: 0.5,
                    minimumSize: const Size(5, 5),
                    maximumSize: const Size(30, 30),
                    numberOfParticles: 1,
                    gravity: 0.1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: Get.height * 0.4,
                  child: ConfettiWidget(
                    confettiController: controller.secondConfettiController,
                    blastDirection: -pi,
                    emissionFrequency: 0.5,
                    minimumSize: const Size(5, 5),
                    maximumSize: const Size(30, 30),
                    numberOfParticles: 1,
                    gravity: 0.1,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
