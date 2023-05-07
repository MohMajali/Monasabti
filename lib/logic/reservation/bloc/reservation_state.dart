part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationClassState extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationSuccess extends ReservationState {
  final ReservationMessageModel message;

  const ReservationSuccess(this.message);
}

class GetReservationsSuccess extends ReservationState {
  final ReservationsModel reservationsModel;

  const GetReservationsSuccess(this.reservationsModel);
}

class ReservationError extends ReservationState {
  final String? message;

  const ReservationError(this.message);
}
