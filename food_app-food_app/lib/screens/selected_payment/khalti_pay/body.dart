import 'package:flutter/material.dart';
import 'package:food_app/screens/selected_payment/pay_now_btn.dart';

class khalti_pay extends StatelessWidget {
  const khalti_pay({Key? key}) : super(key: key);
  //khalti_pay route name
  static String routeName = "/khalti_pay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar for selected payment
      appBar: AppBar(
        title: const Text(
          "Khalti Pay",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //giving static data as details about khalti pre-payment
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: Card(
                        color: Colors.purple.shade50,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.notifications, color: Colors.blue),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Prepayment",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset(
                              "assests/payments/khalti.png",
                              width: 80,
                              height: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Pay with your Khalti Pay Account.",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Please make sure you have sufficient",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "balance in your account.",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: Card(
                        color: Colors.white54,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "  \"You will be redirected to Khalti account to ",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Text(
                                    "  complete your payment:\"",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 10)),
                                  Text(
                                    "1. Login to your Khalti account by your phone",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Text(
                                    "   and mpin.",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Text(
                                    "2. Ensure your account is active and has ",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Text(
                                    "   sufficient balance.",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  Text(
                                    "3. Enter OTP send to your registered mobile number.",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  Text(
                                    "   number.",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //calling pay now button to confirm payment
      bottomNavigationBar: Container(
          color: Colors.white,
          height: 65,
          child: Column(
            children: const [Expanded(child: pay_now())],
          )),
    );
  }
}
