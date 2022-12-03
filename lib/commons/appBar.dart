import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutest/pages/login.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:flutest/pages/register.dart';

Widget myAppBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 28, 31, 26),
    //background color of Appbar to green
    title: Text(title),
    actions: <Widget>[
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
    ],
  );
}
