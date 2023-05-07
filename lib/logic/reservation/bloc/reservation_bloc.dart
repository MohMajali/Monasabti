import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/reservation_message.dart';
import 'package:monasabti/data/models/reservations_model.dart';
import 'package:monasabti/data/repo/reservation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationRepo reservationRepo;
  ReservationBloc(ReservationState reservationState, this.reservationRepo)
      : super(reservationState) {
    on<StartEvent>((event, emit) => emit(ReservationInitial()));
    on<BookNowPressed>((event, emit) async {
      try {
        emit(ReservationLoading());
        if (event.reservationTimeId != 0 && event.price != 0) {
          var reservation = await reservationRepo.reserve(
              event.clientId,
              event.ownerId,
              event.providerId,
              event.reservationTimeId,
              event.price);

          if (!reservation.error) {
            emit(ReservationSuccess(reservation));
          } else {
            emit(const ReservationError("Error In Reservation"));
          }
        } else {
          emit(const ReservationError("Please Select Date & Time"));
        }
      } catch (ex) {
        emit(const ReservationError("Error In Reservation"));
      }
    });

    on<GetReservationsEvent>((event, emit) async {
      try {
        emit(ReservationLoading());
        var getReservations =
            await reservationRepo.getReservations(event.clientId);

        if (getReservations.message == "ok") {
          emit(GetReservationsSuccess(getReservations));
        } else {
          emit(const ReservationError("No List"));
        }
      } catch (ex) {
        emit(ReservationError("No List Exeption $ex"));
      }
    });
  }
}
