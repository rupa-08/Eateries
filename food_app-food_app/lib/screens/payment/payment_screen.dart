import 'package:flutter/material.dart';
import 'package:food_app/screens/payment/components/body.dart';

class payment_ extends StatelessWidget {
  const payment_({Key? key}) : super(key: key);
  static String routeName = "/payment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar for payment
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //leading icon to navigate back
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        title: const Text(
          "Select payment method",
          style: TextStyle(color: Colors.black),
        ),
      ),
      //calling payment in body of scafflod
      body: ppayment_(),
    );
  }
}
