part of 'advertisments_cubit.dart';

abstract class AdvertismentsState extends Equatable {
  const AdvertismentsState();

  @override
  List<Object> get props => [];
}

class AdvertismentsInitial extends AdvertismentsState {}

class AdvertisementsLoaded extends AdvertismentsState {

  final AdvertismentModel advertismentModel;

  const AdvertisementsLoaded(this.advertismentModel);
}
