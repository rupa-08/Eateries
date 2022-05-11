import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  //sign in screen route name
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar for sign in screen
        appBar: AppBar(
          backgroundColor: primaryLightColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(color: txtColor),
          ),
        ),
        //calling Body function in scaffold body
        body: Body());
  }
}
