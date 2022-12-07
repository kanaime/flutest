import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthentificationCheck {
  late bool is_logged;
  late final user;

  User_logged() async {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return true;
    } else {
      return false;
    }
  }

  User_informations() async {
    if (is_logged == true) {
      final user = FirebaseAuth.instance.currentUser!;
    }
  }
}

class AuthCheck extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  getCurrentUser() async {
    if (user != null) {
      String? uid = user?.uid; // <-- User ID
      String? email = user?.email; // <-- Their email
      return [uid, email];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text('test');
  }
}
