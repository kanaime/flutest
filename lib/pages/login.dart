import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutest/pages/my_profil.dart';
import 'package:flutest/services/login_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
            return const MyPageLogin();
          } else {
            return const LoginWidget();
          }
        }),
      ));
}
