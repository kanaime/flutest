import 'package:flutter/material.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

// FUTURE CONNEXION

  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    setState(() {
      isLoading = false;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: myAppBar("Login", context),
            ),
            drawer: myDrawer(context),
            body: Center(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                          child: const FlutterLogo(
                            size: 40,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Container(
                            height: 80,
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text('Log In'),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                singIn();
                              },
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
            )));
  }
}
