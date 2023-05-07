import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/constants.dart';
import 'package:monasabti/logic/reservation/bloc/reservation_bloc.dart';
import '../../../logic/providers/cubit/providers_cubit.dart';
import 'components/booking_date.dart';
import 'components/provider_desc.dart';
import 'components/provider_images.dart';
import 'components/provider_name.dart';
import 'components/provider_type.dart';
import 'components/top_header.dart';

class ProviderDetailsScreen extends StatelessWidget {
  String name, description, image, type;
  int id, ownerId;
  int typeId;
  double rating;
  ProviderDetailsScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.image,
      required this.id,
      required this.rating,
      required this.type,
      required this.ownerId,
      required this.typeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProvidersCubit>(context).getProvidersDetails(id);
    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    log("$typeId");
    return WillPopScope(
      onWillPop: () async {
        if (typeId == 0) {
          BlocProvider.of<ProvidersCubit>(context).getAllProviders();
        } else {
          BlocProvider.of<ProvidersCubit>(context).getProvidersType(typeId);
        }
        return true;
      },
      child: Material(
        color: Color(0XFFD9E4EE),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHeader(
                  height: height, width: width, image: image, rating: rating, typeId: typeId),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProviderName(name: name),
                    const SizedBox(height: 5),
                    ProviderType(type: type),
                    const SizedBox(height: 15),
                    ProviderDesc(description: description),
                    const SizedBox(height: 15),
                    Text(
                      "$name Images",
                      style: const TextStyle(
                          fontSize: 25,
                          color: darkBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    const ProviderImagesComponent(),
                    const SizedBox(height: 8),
                    const Text(
                      "Book Date",
                      style: TextStyle(
                          fontSize: 25,
                          color: darkBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    BookingDate(
                      ownerId: ownerId,
                      providerId: id,
                      reservationBloc: reservationBloc,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
