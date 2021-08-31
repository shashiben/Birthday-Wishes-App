import 'package:flutter/material.dart';
import 'package:suprise/ui/animations/fade_animation.dart';

class ReviewTextFieldWidget extends StatelessWidget {
  final TextEditingController reviewController;
  final Function onPressed;
  const ReviewTextFieldWidget(
      {Key? key, required this.reviewController, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
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
                onPressed: () => onPressed(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
