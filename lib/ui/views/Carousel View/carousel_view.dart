import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suprise/app/configs.dart';
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
                  image: AssetImage(UserInfo.imagesList[currentPage]),
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
            itemCount: UserInfo.imagesList.length,
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
                        UserInfo.imagesList[index],
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
                    xDistance: -50,
                    yDistance: 0,
                    child: Text(
                      UserInfo.titles.elementAt(currentPage),
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
                        UserInfo.description.elementAt(currentPage),
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
