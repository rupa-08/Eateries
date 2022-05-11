import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/payment/payment_screen.dart';

class check_out extends StatelessWidget {
  const check_out({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: SizedBox(
          height: 55,
          width: 150,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pushNamed(context, payment_.routeName);
            },
            child: const Text("Checkout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
