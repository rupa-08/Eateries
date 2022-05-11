import 'package:flutter/material.dart';

class content_ extends StatelessWidget {
  final String? img;
  const content_({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.red,
        ),
        child: Image.asset(
          img!,
          fit: BoxFit.fill,
          //fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
