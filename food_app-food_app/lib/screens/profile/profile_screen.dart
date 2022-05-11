import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/profile/components/body.dart';

class profile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar for profile page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading icon to navigate back
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: txtColor),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: txtColor),
          textAlign: TextAlign.center,
        ),
      ),
      //calling body menthod in scaffold body
      body: body(),
    );
  }
}
