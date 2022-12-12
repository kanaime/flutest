import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutest/pages/login.dart';
import 'package:flutest/pages/logout_page.dart';
import 'package:flutest/services/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmePasswordController.dispose();
    super.dispose();
  }

// FUTURE AJOUT DE DETAIL

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

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

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

      final String authId = FirebaseAuth.instance.currentUser!.uid;
      addUserDetails(
          authId, nameController.text.trim(), emailController.text.trim());

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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Email already use"), backgroundColor: Colors.red));

          break;
      }
    }
  }

//Password controle

  Future passwordDontMatch() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password not match"), backgroundColor: Colors.red));
    setState(() {
      isLoading = false;
    });
    return const RegisterWidget();
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
            backgroundColor: Colors.grey[300],
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: myAppBar("Nouvel utilisateur", context),
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
                                  const EdgeInsets.fromLTRB(20, 50, 20, 20),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Bienvenue !",
                              style: GoogleFonts.bebasNeue(fontSize: 50),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Inscris toi!",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 50),

                            // CONTAINER POUR LE NAME //

                            TextFormNameContainer(
                                nameController: nameController),

                            // CONTAINER POUR L EMAIL //

                            TextFormEmailContainer(
                                emailController: emailController),

                            // CONTAINER POUR LE PASSWORD //

                            TextFormPasswordContainer(
                                passwordController: passwordController),

                            // CONTAINER POUR LE CONFIRM PASSWORD
                            TextFormConfirmPasswordContainer(
                                confirmePasswordController:
                                    confirmePasswordController,
                                passwordController: passwordController),

                            Container(
                                padding: const EdgeInsets.all(20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 109, vertical: 15),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Inscription'),
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (passwordController.text ==
                                        confirmePasswordController.text) {
                                      signUp();
                                    } else {
                                      passwordDontMatch();
                                    }
                                  },
                                )),
                            SwitchToLoginRow(),

                            // BOUTON INSCRIPTION
                          ],
                        ),
                )))));
  }
}

class SwitchToLoginRow extends StatelessWidget {
  const SwitchToLoginRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Déjà inscris ?',
          style: TextStyle(color: Colors.grey[600]),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyLogin(),
                ));
          },
          child: const Text(
            'Connecte toi',
            style: TextStyle(color: Color.fromARGB(255, 75, 64, 175)),
          ),
        ),
      ],
    );
  }
}

class TextFormConfirmPasswordContainer extends StatelessWidget {
  const TextFormConfirmPasswordContainer({
    Key? key,
    required this.confirmePasswordController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController confirmePasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextFormField(
          controller: confirmePasswordController,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 2, color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white)),
            labelText: 'Confirmer mot de passe',
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {
            if (val != passwordController.text) return 'Not Match';

            return null;
          }),
    );
  }
}

class TextFormPasswordContainer extends StatelessWidget {
  const TextFormPasswordContainer({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white)),
          labelText: 'Mot de passe',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            value != null && value.length < 6 ? 'Enter min 6 characters' : null,
      ),
    );
  }
}

class TextFormEmailContainer extends StatelessWidget {
  const TextFormEmailContainer({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white)),
          labelText: 'Email',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
      ),
    );
  }
}

class TextFormNameContainer extends StatelessWidget {
  const TextFormNameContainer({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2, color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white)),
          labelText: 'Nom',
        ),
      ),
    );
  }
}
