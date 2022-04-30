import 'package:flutter/material.dart';
import 'package:python_app1/loginpage.dart';
import 'package:python_app1/mainpage.dart';
import 'package:python_app1/module1.dart';
import 'package:python_app1/module2.dart';
import 'package:python_app1/module3.dart';
import 'package:python_app1/module4.dart';
import 'package:python_app1/module5.dart';
import 'package:python_app1/quizlistpage.dart';
import 'package:python_app1/routes.dart';
import 'package:python_app1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.mainRoute: (context) => MainPage(),
        MyRoutes.quizlistRoute: (context) => QuizListPage(),
        MyRoutes.mod1Route: (context) => Mod1Page(),
        MyRoutes.mod2Route: (context) => Mod2Page(),
        MyRoutes.mod3Route: (context) => Mod3Page(),
        MyRoutes.mod4Route: (context) => Mod4Page(),
        MyRoutes.mod5Route: (context) => Mod5Page(),
      },
    );
  }
}
