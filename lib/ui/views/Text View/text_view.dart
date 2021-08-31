import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/text_view_controller.dart';

class TextView extends GetView<TextViewController> {
  const TextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30.0, color: Colors.black),
                child:
                    AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
                  TyperAnimatedText('When you talk, you are only repeating',
                      speed: Duration(milliseconds: 150)),
                  TyperAnimatedText('something you know.But if you listen,',
                      speed: Duration(milliseconds: 150)),
                  TyperAnimatedText(' you may learn something new.',
                      speed: Duration(milliseconds: 150)),
                  TyperAnimatedText('– Dalai Lama',
                      speed: Duration(milliseconds: 150)),
                ]),
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(controller.title.value),
            automaticallyImplyLeading: false,
          ),
        ));
  }
}
