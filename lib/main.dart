import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/app/app_pages.dart';
import 'package:suprise/app/theme.dart';
import 'package:suprise/core/Bindings/cake_bindings.dart';
import 'package:suprise/core/Bindings/home_bindings.dart';
import 'package:suprise/ui/views/Home%20View/home_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  HomeBinding().dependencies();
  CakeBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: HomeView(),
    );
  }
}
