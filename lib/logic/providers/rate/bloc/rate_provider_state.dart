part of 'rate_provider_bloc.dart';

abstract class RateProviderState extends Equatable {
  const RateProviderState();

  @override
  List<Object> get props => [];
}

class RateProviderInitial extends RateProviderState {}

class RateLoading extends RateProviderState {}

class RateSuccess extends RateProviderState {
  UpdatedMessage updatedMessage;
  RateSuccess({
    required this.updatedMessage,
  });
}

class RateError extends RateProviderState {
  final String message;

  const RateError(this.message);
}
