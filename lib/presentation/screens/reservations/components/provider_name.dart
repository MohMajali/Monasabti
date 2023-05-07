import 'package:flutter/material.dart';
import 'package:monasabti/constants.dart';

import '../../../../data/models/reservations_model.dart';

class ProviderName extends StatelessWidget {
  const ProviderName({Key? key, required this.reservations, required this.i})
      : super(key: key);

  final List<Reservations> reservations;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Provider Name : ",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: darkBlue),
        ),
        Text(
          reservations[i].providerName,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: lightblue),
        ),
      ],
    );
  }
}
