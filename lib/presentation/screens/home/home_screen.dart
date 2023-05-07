import 'package:flutter/material.dart';
import 'package:monasabti/constants.dart';
import 'package:monasabti/presentation/screens/reservations/reservation_screen.dart';
import 'package:monasabti/presentation/screens/home/home_page/home_page.dart';

import 'profile_page/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = [
    const HomePage(),
    const ReservationsScreen(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
            height: 60,
            backgroundColor: lightblue.withOpacity(0.9),
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: darkBlue,
                  ),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(
                    Icons.book,
                    color: darkBlue,
                  ),
                  label: "Reservations"),
              NavigationDestination(
                  icon: Icon(
                    Icons.person,
                    color: darkBlue,
                  ),
                  label: "My Account"),
            ]),
      ),
    );
  }
}
