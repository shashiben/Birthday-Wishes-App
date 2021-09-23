import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:suprise/app/configs.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/widgets/review_text_field.dart';
import 'package:suprise/ui/widgets/review_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RateView extends StatefulWidget {
  const RateView({Key? key}) : super(key: key);

  @override
  State<RateView> createState() => _RateViewState();
}

class _RateViewState extends State<RateView> {
  TextEditingController reviewController = TextEditingController();
  List<Widget> children = <Widget>[];
  @override
  void initState() {
    super.initState();
    setState(() {
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
    });
  }

  shareTextonWhatsapp(String text) => launch(text);

  void addRating() {
    setState(() {
      children.add(ReviewTextFieldWidget(
        reviewController: reviewController,
        onPressed: () {
          if (reviewController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Please, give a review, It just takes only a minute😬",
              ),
              duration: Duration(seconds: 5),
            ));
            //   title: "Please give a review",
            //   message: "It just takes only a minute😬",
            //   icon: Icon(FlutterIcons.sad_cry_faw5, color: Colors.white),
            // ));
          } else {
            setState(() {
              children.removeAt(1);
              children.add(ReviewTextWidget(review: reviewController.text));
              children.add(FadeAnimation(
                delay: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: Icon(
                      FlutterIcons.share_2_fea,
                      color: Colors.white,
                    ),
                    onPressed: () => shareTextonWhatsapp(
                        UserInfo.getWhatsAppText(reviewController.text)),
                  ),
                  subtitle: Text(
                    "So that shashi can feel happy",
                    style: TextStyle(fontSize: 14),
                  ),
                  title: Text(
                    "Share on whatsapp",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                xDistance: 0,
                yDistance: 0,
              ));
            });
          }
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children.toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Made with ❤ by Shashi for his 🌐"),
            ),
          )
        ],
      ),
    );
  }
}
