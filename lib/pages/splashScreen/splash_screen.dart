import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutest/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/animations/123638-sphere.json'),
        backgroundColor: Colors.black,
        splashIconSize: 100,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        nextScreen: MyHomePage(title: 'test'));
  }
}
