import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/cart/components/body.dart';

class cart_screen extends StatelessWidget {
  //cart route name
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: InkWell(
            child: const Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            ), //title
            onTap: () {},
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: txtColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ), //leading icon
        ),
        body: cart_item() //calling cari_item
        );
  }
}
