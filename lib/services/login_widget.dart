import 'package:flutest/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: myAppBar("Espace connexion", context),
        ),
        drawer: myDrawer(context),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconContainer(),
                    const SizedBox(
                      height: 50,
                    ),
                    TitleContainer(text: "Re Bonjour"),
                    const SizedBox(
                      height: 10,
                    ),
                    SubtitleContainer(
                      text: "Te revoila !",
                    ),
                    const SizedBox(height: 50),
                    EmailFormBuild(emailController: emailController),
                    PasswordFormBuild(passwordController: passwordController),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 109, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('Connexion'),
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            signIn();
                          },
                        )),
                    SwitchForm(),
                  ],
                ),
        ),
      ),
    );
  }
}

class SubtitleContainer extends StatelessWidget {
  const SubtitleContainer({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }
}

class TitleContainer extends StatelessWidget {
  const TitleContainer({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(fontSize: 50),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: const Icon(
        Icons.android,
        size: 80,
      ),
    );
  }
}

class SwitchForm extends StatelessWidget {
  const SwitchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pas de compte ?',
          style: TextStyle(color: Colors.grey[600]),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ));
          },
          child: const Text(
            'Inscris toi',
            style: TextStyle(color: Color.fromARGB(255, 75, 64, 175)),
          ),
        ),
      ],
    );
  }
}

class PasswordFormBuild extends StatelessWidget {
  const PasswordFormBuild({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextField(
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
      ),
    );
  }
}

class EmailFormBuild extends StatelessWidget {
  const EmailFormBuild({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextField(
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
      ),
    );
  }
}
