import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/widgets/review_text_field.dart';
import 'package:suprise/ui/widgets/review_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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

  shareTextonWhatsapp(String text) => launch(text);

  void addRating() {
    children.add(ReviewTextFieldWidget(
      reviewController: reviewController,
      onPressed: () {
        if (reviewController.text.isEmpty) {
          if (Get.isSnackbarOpen ?? false) {
          } else {
            Get.showSnackbar(GetBar(
              duration: Duration(seconds: 5),
              title: "Please give a review",
              message: "It just takes only a minute😬",
              icon: Icon(FlutterIcons.sad_cry_faw5, color: Colors.white),
            ));
          }
        } else {
          children.removeAt(1);
          children.add(ReviewTextWidget(review: reviewController.text));
          children.add(FadeAnimation(
            delay: 2,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.orange)),
                child: Icon(
                  FlutterIcons.share_2_fea,
                  color: Colors.orange,
                ),
                onPressed: () => shareTextonWhatsapp(
                    UserInfo.getWhatsAppText(reviewController.text)),
              ),
              subtitle: Text("So that shashi can feel happy"),
              title: Text("Share on whatsapp"),
            ),
            xDistance: 0,
            yDistance: 0,
          ));
        }
      },
    ));
  }
}
