import 'package:flutter/material.dart';
import 'dart:math' as math;

class ParallaxWidget extends StatelessWidget {
  final String assetName;
  final double offset;

  const ParallaxWidget({
    Key? key,
    required this.assetName,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          child: Image.network(
            assetName,
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment(-offset.abs(), 0),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
