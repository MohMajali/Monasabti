part of 'types_cubit.dart';

abstract class TypesState extends Equatable {
  const TypesState();

  @override
  List<Object> get props => [];
}

class TypesInitial extends TypesState {}

class TypesLoaded extends TypesState {
  final TypeModel typeModel;

  const TypesLoaded(this.typeModel);
}
