import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
         CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage("assets/images/defalut_user.png"),
        ),
      ],
    );
  }
}