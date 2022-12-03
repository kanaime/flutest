import 'package:flutest/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: myAppBar("Home Page", context),
        ),
        drawer: myDrawer(context),

        //set app bar from appbar.dart
        // use like this where ever you want

        //set drawer from app_drawer.dart
        //set like this where ever you want
        body: ElevatedButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyForm()),
              );
            }),
            child: const Text('aller au formulaire')));
  }
}
