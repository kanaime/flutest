import 'package:flutest/main.dart';
import 'package:flutest/pages/client_list.dart';
import 'package:flutest/pages/register.dart';
import 'package:flutest/pages/test_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ));
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Home',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                ListTile(
                  leading: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListingClient(),
                          ));
                    },
                    icon: const Icon(
                      Icons.list,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Liste client',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                ListTile(
                  leading: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ));
                    },
                    icon: const Icon(
                      Icons.login,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'S enregistrer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                ListTile(
                  leading: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ));
                    },
                    icon: const Icon(
                      Icons.settings,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Test',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )

                //add more drawer menu here
              ],
            ))),
  );
}
