import 'package:flutest/pages/loginPage/components/login_form.dart';
import 'package:flutter/material.dart';

import '../../../services/login_widget.dart';

class BodyLogin extends StatelessWidget {
  BodyLogin({super.key});

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    IconContainer(),
                    TitleContainer(text: "Re Bonjour"),
                    SizedBox(
                      height: 10,
                    ),
                    SubtitleContainer(
                      text: "Te revoila !",
                    ),
                    SizedBox(height: 5),
                    LoginForm(),
                  ],
                ),
        ),
      ],
    );
  }
}
