import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ProviderName extends StatelessWidget {
  const ProviderName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: lightblue),
    );
  }
}