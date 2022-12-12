import 'package:flutest/pages/registerPage/components/register_form.dart';
import 'package:flutest/pages/registerPage/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyRegister extends StatelessWidget {
  BodyRegister({super.key});
  var isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  Text(
                    "Bienvenue !",
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                  const Text(
                    "Inscris toi!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  RegisterForm(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
      ),
    );
  }
}
