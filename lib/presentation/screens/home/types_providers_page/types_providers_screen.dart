import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/end_points.dart';
import 'package:monasabti/presentation/components/card.dart';

import '../../../../constants.dart';
import '../../../../data/models/provider_model.dart';
import '../../../../logic/providers/cubit/providers_cubit.dart';
import '../../provider/provider_details.dart';

class ProvidersTypeScreen extends StatelessWidget {
  int typeId;
  String typeName;
  ProvidersTypeScreen({Key? key, required this.typeId, required this.typeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProvidersCubit>(context).getProvidersType(typeId);

    List<Provider> providers = [];

    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ProvidersCubit>(context).getAllProviders();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("$typeName Providers"),
          centerTitle: true,
          backgroundColor: darkBlue,
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<ProvidersCubit>(context).getAllProviders();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<ProvidersCubit, ProvidersState>(
          builder: (context, state) {
            if (state is ProvidersTypeLoaded) {
              providers = state.providers.providers;
              return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 1 / 2),
                itemCount: providers.length,
                itemBuilder: (context, i) {
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
                              typeId: typeId,
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
                    itemSize: 18,
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
