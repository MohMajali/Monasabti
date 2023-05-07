import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/advertisments/cubit/advertisments_cubit.dart';
import 'package:monasabti/presentation/components/card.dart';
import '../../../../../data/end_points.dart';
import '../../../../../data/models/advertisment_model.dart';

class AdvertismentsList extends StatelessWidget {
  const AdvertismentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Advertisment> advertisments = [];
    return BlocBuilder<AdvertismentsCubit, AdvertismentsState>(
      builder: (context, state) {
        if (state is AdvertisementsLoaded) {
          advertisments = state.advertismentModel.advertisments;
          return SizedBox(
            height: 340,
            child: ListView.builder(
              itemCount: advertisments.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, i) {
                return CustomeCard(
                  press: () {},
                  id: advertisments[i].id,
                  name: advertisments[i].title,
                  image:
                      "${EndPoints.advertismentsUrl}${advertisments[i].image}",
                  neededFav: false,
                  neededRate: false,
                  totalRate: 0.0,
                  typeOrDesc: advertisments[i].description,
                  height: 300,
                  width: 200,
                  itemSize: 25,
                );
              }),
            ),
          );
        }
        return Container();
      },
    );
  }
}
