import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  //providing route name
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar for sign up page
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: txtColor),
        title: const Text(
          "Sign Up",
          style: TextStyle(color: txtColor),
          textAlign: TextAlign.center,
        ),
      ),
      //calling body function of sign up
      body: const Body(),
    );
  }
}
