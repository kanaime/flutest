import 'package:flutest/main.dart';
import 'package:flutest/pages/loginPage/login_screen.dart';
import 'package:flutest/pages/login_page.dart';
import 'package:flutest/pages/profile/profile_screen.dart';
import 'package:flutest/pages/register.dart';
import 'package:flutest/pages/registerPage/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  MyHomePage.routeName: (context) => MyHomePage(title: 'title'),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  LoginScreen.routeName: (context) => LoginScreen()
};
