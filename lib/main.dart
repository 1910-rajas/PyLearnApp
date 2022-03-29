import 'package:flutter/material.dart';
import 'package:python_app1/loginpage.dart';
import 'package:python_app1/mainpage.dart';
import 'package:python_app1/routes.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.mainRoute: (context) => MainPage(),
      },
    );
  }
}
