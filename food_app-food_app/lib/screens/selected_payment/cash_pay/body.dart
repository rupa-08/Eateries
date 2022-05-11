import 'package:flutter/material.dart';

class cash_pay extends StatelessWidget {
  const cash_pay({Key? key}) : super(key: key);
  //route name for cash payment
  static String routeName = "/cash_pay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar for cash payment
      appBar: AppBar(
        title: const Text(
          "Cash Pay",
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
        //Static information about cash payment
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 80,
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
                                "You can do prepayment through Khalti \n pay account.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset(
                              "assests/payments/cash_on_delivery.png",
                              width: 83,
                              height: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "You can pay in cash to the courier when",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  "you receive the goods at your doorstep.",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Padding(padding: EdgeInsets.only(top: 8.0)),
                                Text(
                                  "\nOR,\n\n  pay when you receieve you goods.",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            )
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
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //       color: Colors.white,
      //       height: 65,
      //       child: Column(
      //         children: const [Expanded(child: pay_now_two())],
      //       )),
      // ),
    );
  }
}
