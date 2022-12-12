import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutest/pages/my_profil.dart';
import 'package:flutest/services/login_widget.dart';
import 'package:flutter/material.dart';

import '../services/register_widget.dart';

void main() {
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static String routeName = '/register';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainRegisterPage());
  }
}

class MainRegisterPage extends StatelessWidget {
  const MainRegisterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Text('On test ')); //CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
            return MyPageLogin();
          } else {
            return const RegisterWidget();
          }
        }),
      ));
}
