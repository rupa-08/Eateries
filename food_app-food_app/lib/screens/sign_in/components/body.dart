import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_in/components/signin_form.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/screens/sign_up/components/or_divider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  //welcoming registered user
                  child: Text(
                    "Welcome Back.",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: getWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  //text to guide user
                  child: Text(
                    "Please provide your username and password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: txtColor,
                        fontStyle: FontStyle.italic,
                        fontSize: getWidth(15)),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                //calling sign form function
                const SignForm(),
                SizedBox(
                  height: getHeight(15),
                ),
                //calling no account function if user does not have an account
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
