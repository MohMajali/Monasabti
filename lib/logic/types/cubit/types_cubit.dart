import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monasabti/data/models/types.dart';
import 'package:monasabti/data/repo/provider_repo.dart';

part 'types_state.dart';

class TypesCubit extends Cubit<TypesState> {
  ProviderRepo providerRepo;
  TypeModel typeModel = TypeModel(message: "", types: []);
  TypesCubit(this.providerRepo) : super(TypesInitial());

  TypeModel getTypes(){
    providerRepo.getTypes().then((types) {
      emit(TypesLoaded(types));
      typeModel = types;
    });
    return typeModel;
  }
}
