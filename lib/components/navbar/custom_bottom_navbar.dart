import 'package:flutest/homepage/home_screen.dart';
import 'package:flutest/pages/calendarPage/calendar_screen.dart';
import 'package:flutest/pages/profile/profile_screen.dart';
import 'package:flutest/state/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = const Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: const Icon(Icons.home),
                  color: MenuState.home == selectedMenu
                      ? Colors.deepPurple
                      : inActiveIconColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePageScreen()),
                    );
                  }),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarScreen()));
                },
                color: MenuState.calendar == selectedMenu
                    ? Colors.deepPurple
                    : inActiveIconColor,
              ),
              IconButton(
                icon: const Icon(Icons.cloud),
                onPressed: () {},
                color: MenuState.cloud == selectedMenu
                    ? Colors.deepPurple
                    : inActiveIconColor,
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: MenuState.profile == selectedMenu
                    ? Colors.deepPurple
                    : inActiveIconColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
            ],
          )),
    );
  }
}
