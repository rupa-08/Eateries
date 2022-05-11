import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/selected_payment/khalti_pay/body.dart';
import 'package:food_app/screens/selected_payment/cash_pay/body.dart';

class ppayment_ extends StatefulWidget {
  const ppayment_({Key? key}) : super(key: key);

  @override
  _ppayment_State createState() => _ppayment_State();
}

class _ppayment_State extends State<ppayment_> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                //navigating to kalti payment procedure
                Navigator.pushNamed(context, khalti_pay.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.08,
                    child: Card(
                        child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        //khalti logo
                        Image.asset(
                          "assests/payments/khalti.png",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Khalti Pay",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                )),
                          ],
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                //navigation for cash payment
                Navigator.pushNamed(context, cash_pay.routeName);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.08,
                    child: Card(
                        child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        //cash payment image
                        Image.asset(
                          "assests/payments/cash_on_delivery.png",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                //cash on delivery text
                                Text("Cash on delivery",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
