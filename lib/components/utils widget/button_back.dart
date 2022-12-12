import 'package:flutter/material.dart';

class BackButtonNav extends StatelessWidget {
  const BackButtonNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      padding: const EdgeInsets.only(top: 15, left: 10),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

class BackButtonNavNone extends StatelessWidget {
  const BackButtonNavNone({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.only(top: 15, left: 10),
      onPressed: () {},
    );
  }
}
