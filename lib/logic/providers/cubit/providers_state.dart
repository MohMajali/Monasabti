part of 'providers_cubit.dart';

abstract class ProvidersState extends Equatable {
  const ProvidersState();

  @override
  List<Object> get props => [];
}

class ProvidersInitial extends ProvidersState {}

class ProviderLoaded extends ProvidersState {
  final ProviderModel providers;

  const ProviderLoaded(this.providers);
}

class ProvidersTypeLoaded extends ProvidersState {
  final ProviderModel providers;

  const ProvidersTypeLoaded(this.providers);
}

class ProviderImagesLoaded extends ProvidersState {
  final ProviderDetailsModel details;

  const ProviderImagesLoaded(this.details);
}
