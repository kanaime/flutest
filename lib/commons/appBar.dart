import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutest/auth/authentification.dart';
import 'package:flutest/pages/login.dart';

Widget myAppBar(String title, BuildContext context) {
  bool isLogged = true;

  if (FirebaseAuth.instance.currentUser?.uid == null) {
    setState() {
      isLogged = false;
    } // not logged
  } else {
    setState() {
      isLogged = true;
    }
    // logged
  }

  return AppBar(
    backgroundColor: const Color.fromARGB(255, 28, 31, 26),
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
                  builder: (context) => const MyLogin(),
                ));
          },
        )
    ],
  );
}
