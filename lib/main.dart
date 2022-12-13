import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutest/commons/routes.dart';
import 'package:flutest/pages/home.dart';
import 'package:flutest/pages/loginPage/login_screen.dart';
import 'package:flutest/pages/my_profil.dart';
import 'package:flutest/pages/profile/profile_screen.dart';
import 'package:flutest/pages/registerPage/register_screen.dart';
import 'package:flutest/pages/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/';
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return /* Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: myAppBar("Home Page", context),
      ),
      drawer: myDrawer(context),

      //set app bar from appbar.dart
      // use like this where ever you want

      //set drawer from app_drawer.dart
      //set like this where ever you want
      body:*/
        StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong!'));
        } else if (snapshot.hasData) {
          return ProfileScreen();
        } else {
          return const RegisterScreen();
        }
      }),
    );
  }
}
