import 'package:flutest/components/navbar/custom_bottom_navbar.dart';
import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/homepage/components/body_home_screen.dart';
import 'package:flutest/state/enums.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: 'Home',
          back: BackButtonNavNone(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 222, 144, 241),
      body: BodyHome(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
