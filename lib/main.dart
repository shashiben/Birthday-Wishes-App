import 'package:flutter/material.dart';
import 'package:suprise/app/theme.dart';

import 'package:suprise/ui/views/Home%20View/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suprise',
      home: HomeView(),
      theme: themeData,
    );
  }
}
