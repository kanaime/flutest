import 'package:flutest/components/navbar/custom_bottom_navbar.dart';
import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/pages/profile/components/body_profile.dart';
import 'package:flutest/state/enums.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: 'Profile',
          back: BackButtonNavNone(),
        ),
      ),
      body: SingleChildScrollView(child: BodyProfile()),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
    return scaffold;
  }
}
