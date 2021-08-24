import 'package:flutter/material.dart';
import 'package:suprise/ui/views/Cake%20View/cake_initial_view.dart';
import 'package:suprise/ui/views/Cake%20View/cake_ready_view.dart';

Widget getCakeWidget(int index) {
  switch (index) {
    case 0:
      return CakeInitialView();
    case 1:
      return CakeReadyView();
    default:
      return SizedBox();
  }
}
