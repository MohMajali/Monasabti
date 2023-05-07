import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ContainerBorders extends StatelessWidget {
   ContainerBorders({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

   var width;
   var height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 3.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightblue.withOpacity(0.8), lightblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
    );
  }
}