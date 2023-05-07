import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BookingTime extends StatelessWidget {
  const BookingTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                color: i == 1 ? pColor : Color(0XFFF2F8FF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 4, spreadRadius: 2),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${i + 8} : 00 AM",
                    style: TextStyle(
                        fontSize: 17,
                        color: i == 1 ? wColor : Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}