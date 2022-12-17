import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  Navbar({required this.text, required this.back});
  final String text;
  final Widget back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text, style: TextStyle(height: 2, color: Colors.grey[800])),
      centerTitle: true,
      leading: back,
      backgroundColor: Color.fromARGB(0, 129, 129, 129),
      elevation: 2.2,
    );
  }
}
