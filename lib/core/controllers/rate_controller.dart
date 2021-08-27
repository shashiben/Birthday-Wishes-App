import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/ui/animations/fade_animation.dart';

class RateController extends GetxController with SingleGetTickerProviderMixin {
  TextEditingController reviewController = TextEditingController();
  RxList<Widget> children = <Widget>[].obs;
  @override
  void onInit() {
    children.add(AnimatedTextKit(
        repeatForever: false,
        totalRepeatCount: 1,
        onFinished: () {
          addRating();
        },
        animatedTexts: [
          TypewriterAnimatedText("Hope you've liked it!🤗🤗",
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              speed: Duration(milliseconds: 150))
        ]));
    super.onInit();
  }

  RxDouble ratingValue = (5.0).obs;

  void addRating() {
    children.add(FadeAnimation(
      delay: 1,
      yDistance: 50,
      xDistance: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            TextFormField(
              controller: reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Please add a review",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (reviewController.text.isEmpty) {
                    Get.showSnackbar(GetBar(
                      title: "Please give a review",
                      message: "Lorem ipsum are ho",
                      icon:
                          Icon(FlutterIcons.sad_cry_faw5, color: Colors.white),
                    ));
                  } else {
                    children.removeAt(1);
                    children.add(Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: RichText(
                          text: TextSpan(
                              text: "Thanks for the review",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: SystemConfig.sourceSansRegular,
                              ),
                              children: [
                            TextSpan(
                                text: "   “ ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black)),
                            TextSpan(
                                text: reviewController.text,
                                style: TextStyle(
                                    fontFamily: SystemConfig.sourceSansItalic,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black)),
                            TextSpan(
                                text: " ”   ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black))
                          ])),
                    ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
