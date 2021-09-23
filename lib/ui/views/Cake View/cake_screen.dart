import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/views/Carousel%20View/carousel_view.dart';

class CakeScreen extends StatefulWidget {
  const CakeScreen({Key? key}) : super(key: key);

  @override
  State<CakeScreen> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<CakeScreen> with TickerProviderStateMixin {
  late AnimationController cakeBakeLottie = AnimationController(
    vsync: this,
  );
  late AnimationController cakeReadyLottie = AnimationController(
    vsync: this,
  );

  int index = 0;
  changeIndex(int value) {
    setState(() {
      index = value;
    });
  }

  actionAfterCakeBake() async {
    cakeBakeLottie.forward();
    await Future.delayed(
        Duration(seconds: cakeBakeLottie.duration?.inSeconds ?? 17));
    changeIndex(1);
  }

  bool showBlowFloatButton = false;

  actionAfterCakeReady() async {
    cakeReadyLottie.forward();
    await Future.delayed(Duration(milliseconds: 4750));
    cakeReadyLottie.stop();
    setState(() {
      showBlowFloatButton = true;
    });
  }

  resumeCakeBlowAction() async {
    setState(() {
      showBlowFloatButton = false;
    });
    cakeReadyLottie.forward();
    await Future.delayed(Duration(
        milliseconds:
            ((cakeReadyLottie.duration?.inMilliseconds ?? 8000) - 4750)));
    navigateToRate();
  }

  navigateToRate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CarouselView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showBlowFloatButton
          ? FadeAnimation(
              delay: 1,
              xDistance: 0,
              yDistance: 50,
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    resumeCakeBlowAction();
                  },
                  label: Text(
                    "Blow Candles",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          : SizedBox(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: getCakeWidget(index),
      ),
    );
  }

  Widget getCakeWidget(int index) {
    switch (index) {
      case 0:
        return Container(
          color: Color(0xFFc1e6f0),
          child: Center(
            child: Lottie.asset('assets/lottie/cake_baking.json',
                alignment: Alignment.center,
                repeat: false,
                controller: cakeBakeLottie, onLoaded: (composition) {
              cakeBakeLottie.duration = composition.duration;
              actionAfterCakeBake();
            }),
          ),
        );
      case 1:
        return Container(
          color: Color(0xFFa44a70),
          child: Center(
            child: Lottie.asset('assets/lottie/cake_ready.json',
                alignment: Alignment.center,
                repeat: false,
                controller: cakeReadyLottie, onLoaded: (composition) {
              cakeReadyLottie.duration = composition.duration;
              actionAfterCakeReady();
            }),
          ),
        );

      default:
        return SizedBox();
    }
  }
}
