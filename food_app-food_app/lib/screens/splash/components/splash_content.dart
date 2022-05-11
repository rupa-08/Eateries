import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/size_config.dart';

class SplashContent extends StatelessWidget {
  //creating varible for splash data text and image
  final String? txt, img;

  //initializing variable
  const SplashContent({
    Key? key,
    this.txt,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(
          flex: 5,
        ),
        //displaying application name at the top of page
        Text(
          "EATERIES",
          style: TextStyle(
            fontSize: getWidth(36),
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // styling splash context text
        Text(txt!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, fontStyle: FontStyle.italic)),
        const Spacer(
          flex: 3,
        ),
        //styling splash image
        Image.asset(
          img!,
          height: getHeight(300),
          width: getWidth(235),
        ),
      ],
    );
  }
}
