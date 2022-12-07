import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutest/pages/login.dart';
import 'package:flutest/services/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<bool> PasswordConfirmed() async {
    if (passwordController.text.trim() ==
        confirmePasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmePasswordController.dispose();
    super.dispose();
  }

// FUTURE AJOUT DE DETAIL

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
  }

// FUTURE INSCRIPTION

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (PasswordConfirmed() == true) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        // on ferme la modale de loading si tout est bon

        setStateIfMounted() {
          if (mounted) {
            setState() {
              isLoading = false;
            }
          }
        }

        addUserDetails(nameController.text.trim(), emailController.text.trim());

        // s'il y a une erreur on la traite ici

      } on FirebaseAuthException catch (e) {
        //on ferme la modale de loading

        setState(() {
          isLoading = false;
        });

        // on ecrit le message d'erreur si ca passe pas

        print(e.code.toString());
        switch (e.code) {
          case "email-already-in-use":
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text("Email already use"),
                backgroundColor: Colors.red));

            break;
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Password not match"),
          backgroundColor: Colors.red));
      setState(() {
        isLoading = false;
      });
      return const RegisterWidget();
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
            body: Form(
                key: formKey,
                child: SingleChildScrollView(
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
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 70),
                              child: const FlutterLogo(
                                size: 60,
                              ),
                            ),

                            // CONTAINER POUR LE NAME //

                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(90.0),
                                  ),
                                  labelText: 'Name',
                                ),
                              ),
                            ),

                            // CONTAINER POUR L EMAIL //

                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(90.0),
                                    ),
                                    labelText: 'Email'),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                              ),
                            ),

                            // CONTAINER POUR LE PASSWORD //

                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(90.0),
                                  ),
                                  labelText: 'Password',
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) =>
                                    value != null && value.length < 6
                                        ? 'Enter min 6 characters'
                                        : null,
                              ),
                            ),

                            // CONTAINER POUR LE CONFIRM PASSWORD

                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextField(
                                controller: confirmePasswordController,
                                obscureText: true,
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
                )))));
  }
}
