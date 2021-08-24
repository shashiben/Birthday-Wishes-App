import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suprise/app/app_pages.dart';
import 'package:suprise/app/theme.dart';
import 'package:suprise/core/Bindings/home_bindings.dart';
import 'package:suprise/ui/views/home_view.dart';

void main() {
  HomeBinding().dependencies();
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
