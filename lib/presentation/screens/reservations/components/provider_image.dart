import 'package:flutter/material.dart';

import '../../../../data/end_points.dart';
import '../../../../data/models/reservations_model.dart';

class ProviderImage extends StatelessWidget {
  const ProviderImage({Key? key, required this.reservations, required this.i})
      : super(key: key);

  final List<Reservations> reservations;
  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15)),
          child: Image.network(
            "${EndPoints.providerUrl}${reservations[i].providerImage}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}