import 'package:flutter/material.dart';

import '../../../../constants.dart';


class OpsReservation extends StatelessWidget {
  const OpsReservation({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("${assetImages}ops.png"))),
        ),
        Text(
          "Something Went Wrong",
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
