import 'package:flutter/material.dart';
import 'package:python_app1/routes.dart';

class QuizListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 20, 20, 20),
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mod1Route);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Module 1",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mod2Route);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Module 2",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mod3Route);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Module 3",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mod4Route);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Module 4",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mod5Route);
            },
            child: Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Module 5",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
