import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        size: 100,
      ),
    );
  }
}
