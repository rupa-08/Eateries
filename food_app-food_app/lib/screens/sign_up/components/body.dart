import 'package:food_app/screens/sign_up/components/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  //displaying welcome message
                  child: Text(
                    "Welcome to Eateries.",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: getWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  //displaying text to prode their credentials
                  child: Text(
                    "Please provide your credentials for \n registering you account.",
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
                //calling signUp function
                const signUp(),
                SizedBox(
                  height: getHeight(15),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                //calling orDivider function
                const orDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
