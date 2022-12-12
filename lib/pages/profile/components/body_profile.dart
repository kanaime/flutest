import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/pages/profile/components/profile_menu.dart';
import 'package:flutest/pages/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          icones: Icons.person,
          text: "Mon compte",
          press: () {},
        ),
        ProfileMenu(
          icones: Icons.settings,
          text: "Parametres",
          press: () {},
        ),
        ProfileMenu(
          icones: Icons.history,
          text: "Mon historique",
          press: () {},
        ),
        ProfileMenu(
          icones: Icons.logout,
          text: "Déconnexion",
          press: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }
}
