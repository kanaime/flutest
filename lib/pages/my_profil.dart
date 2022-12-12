import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/read_data/get_user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutest/auth/authentification.dart';
import 'package:json_annotation/json_annotation.dart';
import '../commons/app_drawer.dart';

class MyPageLogin extends StatelessWidget {
  final String authId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var docu = [];
    var ref = FirebaseFirestore.instance.collection('users').doc(authId);
    docu.add(ref.id);
    var popo = [];
    var test2 =
        FirebaseFirestore.instance.collection('users').doc(authId).get();

    var test = FirebaseFirestore.instance
        .collection('users')
        .doc(authId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
        var userinfos = documentSnapshot.data();
        var jsonTutorial = jsonEncode(userinfos);
        print(jsonTutorial);

        setState() {
          popo = [userinfos];
        }

        var popi = popo.add(userinfos);

        return;
      } else {
        print('Document does not exist on the database');
      }
    });
    // print json

    // TEST

    var document = FirebaseFirestore.instance
        .doc('users/$authId')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      var documents = documentSnapshot.data();

      return documents;
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: myAppBar("My profil", context),
      ),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Signed at ',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              user.email!,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('toto'),
              subtitle: Text('toto'),
              tileColor: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(Icons.arrow_back, size: 32),
              label: const Text(
                'Sign out',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
    );
  }
}
