import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/selected_payment/khalti_pay/khalti_payment_page.dart';

class pay_now extends StatefulWidget {
  const pay_now({Key? key}) : super(key: key);

  @override
  _pay_nowState createState() => _pay_nowState();
}

class _pay_nowState extends State<pay_now> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                width: 170,
                height: 20,
                //payment confirm button
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {
                      //navigating khalti payment page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KhaltiPaymentPage()));
                    },
                    child: const Text("Confirm",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    color: primaryColor),
              )),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class pay_now_two extends StatefulWidget {
  const pay_now_two({Key? key}) : super(key: key);

  @override
  _pay_now_twoState createState() => _pay_now_twoState();
}

class _pay_now_twoState extends State<pay_now_two> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                width: 170,
                height: 20,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {},
                    child: const Text("Confirm",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    color: primaryColor),
              )),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
