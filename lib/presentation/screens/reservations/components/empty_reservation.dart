import 'package:flutter/material.dart';

import '../../../../constants.dart';


class EmptyReservation extends StatelessWidget {
  const EmptyReservation({
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
                  image: AssetImage("${assetImages}empty_cart_icon.jpg"))),
        ),
        Text(
          "No Reservations",
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
