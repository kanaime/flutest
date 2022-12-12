import 'package:flutest/auth/Components/log_components.dart';
import 'package:flutest/commons/constant.dart';
import 'package:flutest/pages/register.dart';
import 'package:flutest/pages/registerPage/register_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        EmailFormBuild(emailController: emailController),
        PasswordFormBuild(passwordController: passwordController),
        Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 70, right: 70),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.purple,
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
              signIn(emailController, passwordController, context);
            },
          ),
        ),
        SwitchForm(),
      ]),
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
                  builder: (context) => RegisterScreen(),
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
