import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class logout extends StatelessWidget {
  static String routeName = "/products_items";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor),
        title: const Text(
          "Food Items",
          style: TextStyle(color: primaryColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
