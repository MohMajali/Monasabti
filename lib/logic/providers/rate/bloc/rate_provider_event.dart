part of 'rate_provider_bloc.dart';

abstract class RateProviderEvent extends Equatable {
  const RateProviderEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends RateProviderEvent {}

class RatePressed extends RateProviderEvent {
  final int clinetId, providerId;
  double rate;

  RatePressed(
      {required this.clinetId, required this.providerId, required this.rate});
}
