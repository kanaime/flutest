import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/pages/logout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutest/pages/login.dart';

Widget myAppBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 71, 33, 68),
    //background color of Appbar to green
    title: Text(title),

    actions: <Widget>[
      if (FirebaseAuth.instance.currentUser?.uid == null)
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyLogin(),
                ));
          },
        )
      else
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogoutPage(),
                ));
          },
        )
    ],
  );
}
