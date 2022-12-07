import 'package:flutest/pages/register.dart';
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

  Future signIn() async {
    // on tente la connexion

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      // on ferme la modale loading

      setState(() {
        isLoading = false;
      });

      // s'il y a une erreur on la traite ici

    } on FirebaseAuthException catch (e) {
      //on ferme la modale de loading

      setState(() {
        isLoading = false;
      });
      // on ecrit le message d'erreur si ca passe pas

      // ignore: avoid_print
      String errorMessenger = e.message.toString();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessenger), backgroundColor: Colors.red));
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
              child: myAppBar("Login", context),
            ),
            drawer: myDrawer(context),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
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
                                signIn();
                              },
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ));
                          },
                          child: Text(
                            'Or Sign up',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
            )));
  }
}
