import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/main.dart';
import 'package:flutest/pages/profile/profile_screen.dart';
import 'package:flutest/pages/registerPage/register_screen.dart';
import 'package:flutter/material.dart';

Future signIn(emailC, passwordC, context) async {
  // on tente la connexion

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailC.text.trim(), password: passwordC.text.trim());

    // on ferme la modale loading

    var isLoading = false;
    Navigator.pop(context);

    // s'il y a une erreur on la traite ici

  } on FirebaseAuthException catch (e) {
    //on ferme la modale de loading

    var isLoading = false;

    // on ecrit le message d'erreur si ca passe pas

    // ignore: avoid_print
    String errorMessenger = e.message.toString();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessenger), backgroundColor: Colors.red));
  }
}

Future addUserDetails(String id, String name, String email) async {
  String authId = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic> demoData = {
    "id": id,
    "name": name,
    "email": email,
  };

  await FirebaseFirestore.instance
      .collection('users')
      .doc(authId)
      .set(demoData);
}

// FUTURE INSCRIPTION

Future signUp(formKey, emailController, passwordController, nameController,
    context) async {
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    // on ferme la modale de loading si tout est bon

    var isLoading = false;

    final String authId = FirebaseAuth.instance.currentUser!.uid;
    addUserDetails(
        authId, nameController.text.trim(), emailController.text.trim());

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));

    // s'il y a une erreur on la traite ici

  } on FirebaseAuthException catch (e) {
    //on ferme la modale de loading

    var isLoading = false;

    // on ecrit le message d'erreur si ca passe pas

    print(e.code.toString());
    switch (e.code) {
      case "email-already-in-use":
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Email already use"), backgroundColor: Colors.red));

        break;
    }
  }
}

Future passwordDontMatch(context) async {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Password not match"), backgroundColor: Colors.red));

  var isLoading = false;

  return RegisterScreen();
}
