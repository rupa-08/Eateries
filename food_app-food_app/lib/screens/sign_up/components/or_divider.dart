import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_in/sign_in_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/screens/sign_up/sign_up_screen.dart';

// this class is called when user does not have account
class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getWidth(16), color: txtColor),
        ),
        GestureDetector(
          //displaying sign up screen when sign up text is clicked
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          //decorating sign up text
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getWidth(18),
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// this class is called when user already have account
class orDivider extends StatelessWidget {
  const orDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(fontSize: getWidth(16)),
        ),
        GestureDetector(
          //displaying sign in screen when sign in text is clicked
          onTap: () {
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
          //decorating sign in text
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: getWidth(18),
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
