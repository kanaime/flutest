import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutest/auth/Components/log_components.dart';
import 'package:flutest/pages/loginPage/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        // CONTAINER POUR LE NAME //

        TextFormNameContainer(nameController: nameController),

        // CONTAINER POUR L EMAIL //

        TextFormEmailContainer(emailController: emailController),

        // CONTAINER POUR LE PASSWORD //

        TextFormPasswordContainer(passwordController: passwordController),

        // CONTAINER POUR LE CONFIRM PASSWORD
        TextFormConfirmPasswordContainer(
            confirmePasswordController: confirmePasswordController,
            passwordController: passwordController),

        Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 109, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 15,
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
                  signUp(_formKey, emailController, passwordController,
                      nameController, context);
                } else {
                  passwordDontMatch(context);
                }
              },
            )),
        SwitchToLoginRow(),
      ]),
    );
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
                  builder: (context) => const LoginScreen(),
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
