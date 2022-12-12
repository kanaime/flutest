import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/read_data/get_user_name.dart';
import 'package:flutter/material.dart';

import '../commons/app_drawer.dart';

class LogoutPage extends StatelessWidget {
  final String authId = FirebaseAuth.instance.currentUser!.uid;

  LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var docu = [];
    var ref = FirebaseFirestore.instance.collection('users').doc(authId);
    docu.add(ref.id);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: myAppBar("Deconnexion", context),
      ),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Icon(
                Icons.logout,
                size: 80,
              ),
            ),
            const Text(
              "Es-tu sur de vouloir nous quitter?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.purple,
              ),
              label: const Text(
                'Déconnexion',
                style: TextStyle(fontSize: 24),
              ),
              icon: const Icon(Icons.arrow_forward, size: 32),
              onPressed: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
    );
  }
}
