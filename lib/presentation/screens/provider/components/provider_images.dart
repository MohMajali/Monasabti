import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/models/provider_details_model.dart';

import '../../../../data/end_points.dart';
import '../../../../logic/providers/cubit/providers_cubit.dart';

class ProviderImagesComponent extends StatelessWidget {
  const ProviderImagesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProviderImages> images = [];
    return BlocBuilder<ProvidersCubit, ProvidersState>(
      builder: (context, state) {
        if (state is ProviderImagesLoaded) {
          images = state.details.images.images;
          return Center(
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.transparent)),
                    child: Image.network(
                        "${EndPoints.providerUrl}${images[i].image}"),
                  );
                },
              ),
            ),
          );
        }
        return Container(
          color: Colors.red,
          height: 10,
        );
      },
    );
  }
}
