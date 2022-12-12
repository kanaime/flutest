import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key, required this.text, required this.icones, required this.press})
      : super(key: key);

  final String text;
  final icones;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.grey),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icones,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
