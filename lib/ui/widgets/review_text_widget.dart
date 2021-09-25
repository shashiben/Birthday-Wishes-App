import 'package:flutter/material.dart';
import 'package:suprise/app/configs.dart';

class ReviewTextWidget extends StatelessWidget {
  final String review;
  const ReviewTextWidget({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: RichText(
          text: TextSpan(
              text: "Thanks for the review",
              style: const TextStyle(
                color: Colors.black,
                fontFamily: SystemConfig.sourceSansRegular,
              ),
              children: [
            const TextSpan(
                text: "   “ ",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black)),
            TextSpan(
                text: review,
                style: const TextStyle(
                    fontFamily: SystemConfig.sourceSansItalic,
                    fontStyle: FontStyle.italic,
                    color: Colors.black)),
            TextSpan(
                text: " ”   ",
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black))
          ])),
    );
  }
}
