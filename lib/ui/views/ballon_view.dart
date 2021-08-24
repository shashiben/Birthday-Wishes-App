import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/core/controllers/home_controller.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/widgets/animated_ballon_widget.dart';

class BallonView extends GetView<HomeController> {
  const BallonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Image.asset('assets/images/happy_birthday.png')),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              child: FadeAnimation(
                  delay: 5.2,
                  xDistance: 0,
                  yDistance: Get.width / 2,
                  yDuration: Duration(seconds: 2),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedTextKit(
                      onFinished: () {
                        printInfo(info: "Animation Done");
                      },
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Happy Birthday\n${UserInfo.name}',
                          textStyle:
                              TextStyle(fontSize: 50.0, fontFamily: 'Horizon'),
                          textAlign: TextAlign.center,
                          speed: Duration(milliseconds: 500),
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
                  emissionFrequency: 0.6,
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
                  emissionFrequency: 0.6,
                  minimumSize: const Size(5, 5),
                  maximumSize: const Size(30, 30),
                  numberOfParticles: 1,
                  gravity: 0.1,
                ),
              ),
            ),
          ],
        ));
  }
}
