import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/app/app_pages.dart';
import 'package:suprise/app/theme.dart';
import 'package:suprise/core/Bindings/cake_bindings.dart';
import 'package:suprise/core/Bindings/home_bindings.dart';
import 'package:suprise/core/Bindings/rate_screen_bindings.dart';
import 'package:suprise/ui/views/Rate%20View/rate_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  HomeBinding().dependencies();
  CakeBindings().dependencies();
  RateScreenBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
      title: 'Suprise',
      getPages: AppPages.routes,
      theme: themeData,
      home: RateView(),
    );
  }
}
