import 'package:flutter/material.dart';
import 'package:monasabti/constants.dart';

class ProviderType extends StatelessWidget {
  const ProviderType({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: TextStyle(
              fontSize: 18, color: darkBlue.withOpacity(0.6)),
        )
      ],
    );
  }
}