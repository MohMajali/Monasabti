part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends ReservationEvent {}

class BookNowPressed extends ReservationEvent {
  final int clientId, ownerId, providerId, reservationTimeId;
  final double price;

  const BookNowPressed(
      {required this.clientId,
      required this.ownerId,
      required this.providerId,
      required this.reservationTimeId,
      required this.price});
}

class GetReservationsEvent extends ReservationEvent {
  final int clientId;

  const GetReservationsEvent({required this.clientId});
}
