import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants.dart';

class CustomeCard extends StatelessWidget {
  String image, name, typeOrDesc;
  bool neededRate, neededFav;
  int id;
  double totalRate, height, width, itemSize;
  VoidCallback press;
  CustomeCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.neededFav,
      required this.neededRate,
      required this.totalRate,
      required this.typeOrDesc,
      required this.height,
      required this.width,
      required this.itemSize, 
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              color: const Color(0XFFF2F8FF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: press,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                  offWhite, BlendMode.colorBurn),
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (neededFav)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Color(0XFFF2F2F8FF),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.7),
                                  blurRadius: 4,
                                  spreadRadius: 2)
                            ]),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_outline,
                            color: pColor,
                            size: 28,
                          ),
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: darkBlue),
                    ),
                    Text(
                      typeOrDesc,
                      style: TextStyle(
                          fontSize: 18, color: darkBlue.withOpacity(0.6)),
                    ),
                    const SizedBox(height: 8),
                    if (neededRate)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: itemSize,
                            initialRating: totalRate,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 2,
                            ),
                            onRatingUpdate: (value) {},
                          )
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
