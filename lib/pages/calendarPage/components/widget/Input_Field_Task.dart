import 'package:flutter/material.dart';

class InputFieldTask extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputFieldTask(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(title),
        ),
        Container(
            child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ))
      ],
    );
  }
}
