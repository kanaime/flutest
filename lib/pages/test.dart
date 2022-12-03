import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutter/material.dart';

import '../commons/app_drawer.dart';

class MyPageLogin extends StatelessWidget {
  const MyPageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: myAppBar("Home Page", context),
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
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
