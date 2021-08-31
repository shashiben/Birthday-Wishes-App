import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/core/controllers/carousel_controller.dart';
import 'package:suprise/ui/widgets/parallax_animation.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  PageController pageController = PageController();
  double pageOffset = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page ?? 0;
      });
      print("Page Offset us:$pageOffset");
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CarouselViewController>();
    return Scaffold(
      body: Container(
          child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) => ParallaxWidget(
            assetName:
                "https://m.media-amazon.com/images/I/81nndQAg2nL._SL1500_.jpg",
            offset: pageOffset),
      )),
      appBar: AppBar(
        title: Text(controller.title.value),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
