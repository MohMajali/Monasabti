import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/providers/cubit/providers_cubit.dart';
import 'package:monasabti/main.dart';

import '../../../../constants.dart';
import '../../../../data/models/provider_details_model.dart';
import '../../../../logic/reservation/bloc/reservation_bloc.dart';
import 'book_now.dart';

class BookingDate extends StatefulWidget {
  int ownerId, providerId;
  ReservationBloc reservationBloc;
  BookingDate(
      {Key? key,
      required this.ownerId,
      required this.providerId,
      required this.reservationBloc})
      : super(key: key);

  @override
  State<BookingDate> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  List<ProviderDates> providerDates = [];
  int index = 0;
  int reservationId = 0;
  double price = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProvidersCubit, ProvidersState>(
      builder: (context, state) {
        if (state is ProviderImagesLoaded) {
          providerDates = state.details.times.dates;
          return Column(
            children: [
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: providerDates.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          index = i;
                          reservationId = providerDates[i].id;
                          price = providerDates[i].price.toDouble();
                          // log(" id = $reservationId");
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25),
                        decoration: BoxDecoration(
                          color: index == i ? darkBlue : Color(0XFFF2F8FF),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 4,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${providerDates[i].startDate} - ${providerDates[i].endDate}",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: index == i
                                      ? wColor
                                      : Colors.black.withOpacity(0.6)),
                            ),
                            Text(
                              "${providerDates[i].startTime} - ${providerDates[i].endTime}",
                              style: TextStyle(
                                  color: index == i
                                      ? wColor
                                      : Colors.black.withOpacity(0.6),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${providerDates[i].price} JDs",
                              style: TextStyle(
                                  color: index == i
                                      ? wColor
                                      : Colors.black.withOpacity(0.6),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              BookNow(
                width: width,
                clientId: pref!.getInt("id")!,
                ownerId: widget.ownerId,
                price: price,
                providerId: widget.providerId,
                reservationId: reservationId,
                reservationBloc: widget.reservationBloc,
              ),
              const SizedBox(height: 20),
            ],
          );
        }
        return Container();
      },
    );
  }
}

/*




 */