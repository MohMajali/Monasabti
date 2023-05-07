import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/logic/providers/cubit/providers_cubit.dart';

import '../../../../constants.dart';

class TopHeader extends StatelessWidget {
   TopHeader({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.rating,
      required this.typeId
  }) : super(key: key);

  final double height;
  final double width;
  final String image;
  final double rating;
  int typeId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2.75,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            pColor.withOpacity(0.9),
            pColor.withOpacity(0),
            pColor.withOpacity(0),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Color(0XFFF2F8FF),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.2),
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (typeId == 0) {
                              BlocProvider.of<ProvidersCubit>(context)
                                  .getAllProviders();
                            } else {
                              BlocProvider.of<ProvidersCubit>(context)
                                  .getProvidersType(typeId);
                            }
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: pColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Rating",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: wColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "$rating",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: wColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
