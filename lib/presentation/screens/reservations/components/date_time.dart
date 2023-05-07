import 'package:flutter/material.dart';

import '../../../../data/models/reservations_model.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({Key? key, required this.reservations, required this.i})
      : super(key: key);

  final List<Reservations> reservations;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            "${reservations[i].startDate} - ${reservations[i].endDate} ${reservations[i].startTime} - ${reservations[i].endTime}",
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}