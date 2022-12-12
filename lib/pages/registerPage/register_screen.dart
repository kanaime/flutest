import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/pages/profile/profile_screen.dart';
import 'package:flutest/pages/registerPage/components/body_register.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Navbar(
            text: "Inscription",
            back: BackButtonNavNone(),
          ),
        ),
        body: BodyRegister());
  }
}
