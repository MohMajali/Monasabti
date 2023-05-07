import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/providers/cubit/providers_cubit.dart';
import 'package:monasabti/logic/reservation/bloc/reservation_bloc.dart';
import 'package:monasabti/main.dart';

import '../../../constants.dart';
import '../../../data/models/reservations_model.dart';
import 'components/empty_reservation.dart';
import 'components/ops.dart';
import 'components/reservation_cart.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReservationBloc>(context)
        .add(GetReservationsEvent(clientId: pref!.getInt("id")!));
    // reservationBloc.add(GetReservationsEvent(clientId: pref!.getInt("id")!));
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        // BlocProvider.of<ProvidersCubit>(context).getAllProviders();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Reservations"),
            centerTitle: true,
            backgroundColor: darkBlue,
          ),
          body: BlocBuilder<ReservationBloc, ReservationState>(
            builder: (context, state) {
              if (state is ReservationLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetReservationsSuccess) {
                List<Reservations> reservations =
                    state.reservationsModel.reservations;
                if (reservations.isNotEmpty) {
                  return ReservationCart(reservations: reservations);
                } else {
                  return EmptyReservation(height: height);
                }
              } else if (state is ReservationError) {
                log("${state.message}");
                return OpsReservation(
                  height: height,
                );
              }
              return Container();
            },
          )),
    );
  }
}
