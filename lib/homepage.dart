import 'package:flutter/material.dart';
import 'package:python_app1/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 14, 13, 13),
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          Text(
            "PyLearn",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              //     fontStyle: FontStyle.normal,
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Image.asset(
            "assets/images/pylogo4.png",
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 30.0,
          ),
          /*    ElevatedButton(
              child: Text("Start Learning"),
              style: TextButton.styleFrom(),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              }),*/
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "Start Learning!",
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
              ))
        ],
      ),
    );
  }
}
