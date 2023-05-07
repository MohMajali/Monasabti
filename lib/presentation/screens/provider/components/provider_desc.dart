import 'package:flutter/material.dart';
import 'package:monasabti/constants.dart';

class ProviderDesc extends StatelessWidget {
  const ProviderDesc({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkBlue.withOpacity(0.6)),
      textAlign: TextAlign.justify,
    );
  }
}