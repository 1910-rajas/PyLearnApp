import 'package:flutter/material.dart';
import 'package:python_app1/routes.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 14, 13, 13),
      child: Column(
        children: [
          SizedBox(
            height: 350.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.quizlistRoute);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Start Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
