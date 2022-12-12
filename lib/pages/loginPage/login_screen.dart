import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/pages/loginPage/components/body_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: "Connexion",
          back: BackButtonNavNone(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: BodyLogin()),
    );
  }
}
