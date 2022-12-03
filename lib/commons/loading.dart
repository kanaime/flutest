import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 40,
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
