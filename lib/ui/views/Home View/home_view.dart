import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/utils/home_utils.dart';
import 'package:suprise/ui/views/Cake%20View/cake_screen.dart';
import 'package:suprise/ui/widgets/animated_ballon_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController cakeCardLottieController =
      AnimationController(vsync: this);
  late AnimationController lightBulbLottieController =
      AnimationController(vsync: this);

  late ConfettiController firstConfettiController =
      ConfettiController(duration: const Duration(seconds: 4));

  late ConfettiController secondConfettiController =
      ConfettiController(duration: const Duration(seconds: 4));
  String title = "Click on Bulb";
  int index = 0;
  bool isBulbLottieLoaded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(title),
        ),
        body: getWidget(index, isBulbLottieLoaded));
  }

  Widget getWidget(int index, bool isLottieLoaded) {
    return AnimatedContainer(
      curve: Curves.easeInToLinear,
      duration: Duration(seconds: 2),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: !isLottieLoaded
              ? LinearGradient(
                  colors: HomeUtils.darkGradient,
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)
              : LinearGradient(
                  colors: [Colors.white, Colors.white70, Colors.white60])),
      child: getChild(index),
    );
  }

  void changeIndex(int value) async {
    setState(() {
      index = value;
    });
    if (value == 1) {
      await Future.delayed(Duration(seconds: 6));
      firstConfettiController.play();
      secondConfettiController.play();
      await Future.delayed(Duration(seconds: 7));
      cakeCardLottieController.forward();
    }
  }

  startBulbLottieAnimation() async {
    lightBulbLottieController.forward();
    await Future.delayed(
        Duration(milliseconds: lightBulbLottieController.duration!.inSeconds));
    setState(() {
      title = "";
      isBulbLottieLoaded = true;
    });

    await Future.delayed(Duration(seconds: 2));
    changeIndex(1);
  }

  bool showNextButton = false;
  showButton() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        showNextButton = true;
      });
    });
  }

  navigateToNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CakeScreen()));
  }

  Widget getChild(int index) {
    switch (index) {
      case 0:
        return Container(
          child: Container(
              child: Center(
            child: GestureDetector(
              onTap: () => startBulbLottieAnimation(),
              child: Lottie.asset('assets/lottie/bulb.json',
                  alignment: Alignment.center,
                  repeat: false,
                  controller: lightBulbLottieController,
                  onLoaded: (composition) {
                lightBulbLottieController.duration = composition.duration;
              }),
            ),
          )),
        );
      case 1:
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FadeAnimation(
                      delay: 5.2,
                      xDistance: 0,
                      yDistance: -MediaQuery.of(context).size.width / 2,
                      yDuration: Duration(seconds: 2),
                      child: Lottie.asset('assets/lottie/cake_card.json',
                          alignment: Alignment.center,
                          controller: cakeCardLottieController,
                          onLoaded: (composition) {
                        cakeCardLottieController.duration =
                            composition.duration;
                      }, repeat: false)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FadeAnimation(
                      delay: 15,
                      xDistance: 0,
                      yDistance: MediaQuery.of(context).size.width / 2,
                      yDuration: Duration(seconds: 2),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: showNextButton
                            ? Container(
                                margin: EdgeInsets.only(bottom: 20)
                                    .copyWith(left: 20, right: 20),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  child: MaterialButton(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      onPressed: navigateToNext,
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
                                  showButton();
                                },
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    'Happy Birthday\n${UserInfo.name}',
                                    textStyle: TextStyle(
                                        fontSize: 40.0,
                                        fontFamily: SystemConfig.canterbury),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ConfettiWidget(
                      confettiController: firstConfettiController,
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ConfettiWidget(
                      confettiController: secondConfettiController,
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
            ));
      default:
        return Center(
          child: Text("No page found\nreport to shashi"),
        );
    }
  }
}
