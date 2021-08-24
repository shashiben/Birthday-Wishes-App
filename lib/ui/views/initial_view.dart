import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialView extends GetView {
  final int index;
  const InitialView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [],
      ),
    ));
  }
}
