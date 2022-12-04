import 'package:flutest/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  // final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

// FUTURE INSCRIPTION

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      /*
      setState(() {
        isLoading = false;
      });
      */
      setStateIfMounted() {
        if (mounted)
          setState() {
            isLoading = false;
          }
        ;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
              child: myAppBar("Register", context),
            ),
            drawer: myDrawer(context),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Center(
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
                            size: 60,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextField(
                            // controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Name',
                            ),
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
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextField(
                            // controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Confirm Password',
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
                              child: const Text('sign up'),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                signUp();
                              },
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyLogin(),
                                ));
                          },
                          child: Text(
                            'Already an account Login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
            ))));
  }
}
