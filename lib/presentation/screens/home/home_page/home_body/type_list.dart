import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasabti/data/models/types.dart';

import '../../../../../constants.dart';
import '../../../../../logic/types/cubit/types_cubit.dart';
import '../../types_providers_page/types_providers_screen.dart';

class TypeList extends StatelessWidget {
  // TypeModel types;
  const TypeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Type> types = [];
    return BlocBuilder<TypesCubit, TypesState>(
      builder: (context, state) {
        if (state is TypesLoaded) {
          types = state.typeModel.types;
          return SizedBox(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: types.length,
                itemBuilder: ((context, i) {
                  return InkWell(
                    onTap: () {
                      // log(" id is : ${providers.providers[i].providerId}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProvidersTypeScreen(
                                typeId: types[i].id, typeName: types[i].name),
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: offWhite,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: bColor,
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Center(
                              child: CachedNetworkImage(
                            imageUrl:
                                "https://m.media-amazon.com/images/I/61Gh-4LQXSL.png",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.colorBurn),
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          types[i].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: darkBlue.withOpacity(0.7)),
                        )
                      ],
                    ),
                  );
                })),
          );
        }

        return Container();
      },
    );
  }
}
