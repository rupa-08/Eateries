import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/components/questions_answers.dart';

class help_scrn extends StatefulWidget {
  const help_scrn({Key? key}) : super(key: key);

  @override
  State<help_scrn> createState() => _help_scrnState();
}

class _help_scrnState extends State<help_scrn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: iconColor,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
        body: const help_body(),
      ),
    );
  }
}

class help_body extends StatefulWidget {
  const help_body({Key? key}) : super(key: key);

  @override
  _help_bodyState createState() => _help_bodyState();
}

class _help_bodyState extends State<help_body> {
  var Selected_food_item = [
    {
      "title": "What is Express Delivery?",
      "text": "Express Delivery",
      "description":
          "\n       Express delivery is the fastest form of shipping. The customer pays an extra shipping cost for this type of delivery, as the shipment will get transported to him anywhere between 24 to 72 hours. Delivery by express is the fastest delivery method.\n\nExpress shipping is ideal for:\n\n1. Sending urgent documents\n\n2. Businesses who need to send goods to clients quickly\n\n 3.Anyone who needs to receive a parcel immediately\n\n4. Travellers who want luggage to meet them at their destination",
    },
    {
      "title": "Can I make online payment?",
      "text": "Pay online",
      "description":
          "\n      Online payments are payments that are initiated over the internet for goods or services purchased either online or offline. Common methods to facilitate this include: Bank Debits via online mandate (often referred to as Direct Debit - which is the terminology we'll use in this guide). We allow you to pay online by khalti payment.\n\n       Khalti is a mobile wallet, payment gateway & service provider in Nepal. It allows users to pay for a range of services like basic utility payments, hotel bookings, movie and domestic flight tickets, events and many more. Khalti simplify lives of people by bringing financial inclusivity to every individual in Nepal and take the payment industry from offline to online through best practices.",
    },
    {
      "title": "Can cancel my order?",
      "text": "Order Cancelation",
      "description":
          "\n       You can't cancel order after you have placed the order. \n The product that you order will already be in dispatch process after you placed the order. So, it can't be cancled. These foods are on sale so once you have placed the order you can't cancel them.",
    },
    {
      "title": "What are the promised delivery timelines?",
      "text": "Delivery Timelines",
      "description":
          "\n      We always try our best to deliver your order at the earliest! You order gets delivered within the 24 hour time after you placed the order. You can also pick up your order from our office at kamalpohkari, city center.",
    },
    {
      "title": "Do you allow cash on delivery?",
      "text": "Cash on delivery",
      "description":
          "\n     Yes, we do allow cash on delivery. You can pay on cash when your product gets delivered.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: Selected_food_item.length,
          itemBuilder: (context, index) {
            return help_bodyp_(
              title: Selected_food_item[index]["title"],
              text: Selected_food_item[index]["text"],
              descripton: Selected_food_item[index]["description"],
            );
          }),
    );
  }
}

class help_bodyp_ extends StatelessWidget {
  final title;
  final text;
  final descripton;

  help_bodyp_({this.title, this.text, this.descripton});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: new Text("hero 1"),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => q_and_a(
                    help_txt: text,
                    help_description: descripton,
                  ))),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                )),
          ),
        ),
      ),
    );
  }
}
