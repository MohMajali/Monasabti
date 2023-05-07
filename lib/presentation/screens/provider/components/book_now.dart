import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../logic/reservation/bloc/reservation_bloc.dart';

class BookNow extends StatelessWidget {
  int clientId, ownerId, providerId, reservationId;
  double price;
  ReservationBloc reservationBloc;
  BookNow(
      {Key? key,
      required this.width,
      required this.clientId,
      required this.ownerId,
      required this.price,
      required this.providerId,
      required this.reservationId,
      required this.reservationBloc})
      : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationBloc, ReservationState>(
      listener: (context, state) {
        if (state is ReservationLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ReservationSuccess) {
          SuccessAlertBox(
              title: "Thank you",
              messageText: state.message.message,
              context: context,
              buttonColor: darkBlue,
              icon: Icons.check_circle,
              titleTextColor: darkBlue);
        } else if (state is ReservationError) {
          WarningAlertBoxCenter(
              messageText: state.message,
              context: context,
              titleTextColor: Colors.red);
        }
      },
      child: Material(
        color: darkBlue,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            reservationBloc.add(BookNowPressed(
                clientId: clientId,
                ownerId: ownerId,
                providerId: providerId,
                reservationTimeId: reservationId,
                price: price));

            // reservationBloc.close();
          },
          child: SizedBox(
            height: 60,
            width: width,
            child: const Center(
              child: Text(
                "BOOK NOW",
                style: TextStyle(
                    color: wColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
