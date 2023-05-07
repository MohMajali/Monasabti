import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:monasabti/constants.dart';
import 'package:monasabti/logic/providers/rate/bloc/rate_provider_bloc.dart';

import '../../../../data/models/reservations_model.dart';
import '../../../../logic/providers/cubit/providers_cubit.dart';
import '../../../../main.dart';
import 'date_time.dart';
import 'price.dart';
import 'provider_image.dart';
import 'provider_name.dart';
import 'provider_phone.dart';

class ReservationCart extends StatelessWidget {
  const ReservationCart({
    Key? key,
    required this.reservations,
  }) : super(key: key);

  final List<Reservations> reservations;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RateProviderBloc, RateProviderState>(
      listener: (context, state) {
        if (state is RateLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RateSuccess) {
          SuccessAlertBox(
              title: "Rate Success",
              context: context,
              messageText: "Thank You For Rating",
              buttonColor: darkBlue,
              icon: Icons.check_circle,
              titleTextColor: darkBlue);
          BlocProvider.of<ProvidersCubit>(context).getAllProviders();
        } else if (state is RateError) {
          WarningAlertBox(
              title: "Error in Rate",
              context: context,
              messageText: state.message);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: reservations.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                openDialig(context, reservations[i].providerName,
                    reservations[i].providerId);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ProviderImage(reservations: reservations, i: i),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProviderName(reservations: reservations, i: i),
                          const SizedBox(height: 10),
                          ProviderPhone(reservations: reservations, i: i),
                          const SizedBox(height: 10),
                          Price(reservations: reservations, i: i),
                          const SizedBox(height: 5),
                          DateAndTime(reservations: reservations, i: i)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future openDialig(BuildContext context, String providerName, int providerId) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            "Rate $providerName",
            style: const TextStyle(color: darkBlue, fontSize: 20),
          )),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                itemSize: 30,
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 2,
                ),
                onRatingUpdate: (value) {
                  BlocProvider.of<RateProviderBloc>(context).add(RatePressed(
                      clinetId: pref!.getInt("id")!,
                      providerId: providerId,
                      rate: value));
                },
                maxRating: 5,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(color: lightblue, fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }
}
