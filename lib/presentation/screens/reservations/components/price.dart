import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../data/models/reservations_model.dart';

class Price extends StatelessWidget {
  const Price({Key? key, required this.reservations, required this.i})
      : super(key: key);

  final List<Reservations> reservations;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Price : ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: darkBlue),
        ),
        Text(
          "${reservations[i].reservationPrice} JDs",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: lightblue),
        ),
      ],
    );
  }
}