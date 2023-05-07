import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/end_points.dart';
import 'package:monasabti/presentation/components/card.dart';
import '../../../../../data/models/provider_model.dart';
import '../../../../../logic/providers/cubit/providers_cubit.dart';
import '../../../provider/provider_details.dart';

class ProivderList extends StatelessWidget {
  ProivderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Provider> providers = [];
    return BlocBuilder<ProvidersCubit, ProvidersState>(
      builder: (context, state) {
        if (state is ProviderLoaded) {
          providers = state.providers.providers;
          return SizedBox(
            height: 340,
            child: ListView.builder(
                itemCount: providers.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, i) {
                  return CustomeCard(
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProviderDetailsScreen(
                                id: providers[i].providerId,
                                name: providers[i].providerName,
                                description: providers[i].providerDesc,
                                image:
                                    "${EndPoints.providerUrl}${providers[i].providerImage}",
                                rating: providers[i].providerRate,
                                type: providers[i].typeName,
                                ownerId: providers[i].ownerId,
                                typeId: 0,
                              ),
                            ));
                      },
                      id: providers[i].providerId,
                      name: providers[i].providerName,
                      image:
                          "${EndPoints.providerUrl}${providers[i].providerImage}",
                      neededFav: true,
                      neededRate: true,
                      totalRate: providers[i].providerRate,
                      typeOrDesc: providers[i].typeName,
                      height: 300,
                      width: 200,
                      itemSize: 25);
                })),
          );
        }
        return Container();
      },
    );
  }
}
