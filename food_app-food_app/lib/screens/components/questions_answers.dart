import 'package:flutter/material.dart';

class q_and_a extends StatefulWidget {
  final help_txt;
  final help_description;

  const q_and_a({
    Key? key,
    this.help_txt,
    this.help_description,
  }) : super(key: key);

  @override
  _q_and_aState createState() => _q_and_aState();
}

class _q_and_aState extends State<q_and_a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Frequently Asked Question",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
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
      body: ListView(children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(widget.help_txt,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 24)),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(widget.help_description,
                style: const TextStyle(color: Colors.black54, fontSize: 20)),
          ),
        ),
      ]),
    );
  }
}
