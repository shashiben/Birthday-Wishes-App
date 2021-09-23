import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suprise/ui/animations/fade_animation.dart';
import 'package:suprise/ui/views/Rate%20View/rate_view.dart';

class CarouselView extends StatefulWidget {
  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  late PageController pageController;
  int currentPage = 0;
  double offset = 0.0;
  changePageValue(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        offset = pageController.page!;
      });
    });
  }

  navigateToReviews() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RateView()));
  }

  List<String> imagesList = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
  ];
  List<String> titles = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
  ];
  List<String> description = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud "
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: currentPage == 3
          ? FadeAnimation(
              delay: 2,
              xDistance: 0,
              yDistance: 30,
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () => navigateToReviews(),
                  label: Text("Go to Review")),
            )
          : SizedBox(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagesList[currentPage]),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: pageController,
            itemCount: imagesList.length,
            physics: BouncingScrollPhysics(),
            onPageChanged: (int page) {
              changePageValue(page);
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        imagesList[index],
                        height: size.height * 0.6,
                        alignment: Alignment(-offset.abs() + currentPage, 0),
                        width: size.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: size.height * 0.6,
                    width: size.width * 0.8,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    delay: 1,
                    xDistance: 0,
                    yDistance: 50,
                    child: Text(
                      titles.elementAt(currentPage),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    xDistance: 0,
                    yDistance: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        description.elementAt(currentPage),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
