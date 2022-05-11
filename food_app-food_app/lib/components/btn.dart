import 'package:flutter/material.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/constants.dart';

class btn_ extends StatelessWidget {
  //varibles and function for button
  final String? sop_txt;
  final Function? press;

  //initializing
  const btn_({
    Key? key,
    this.sop_txt,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width / 2.1,
      //Text Button
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          primary: Colors.white,
          backgroundColor: primaryColor,
        ),
        onPressed: press as void Function()?, //on pressed return funciton
        child: Text(
          sop_txt!,
          style: TextStyle(
            fontSize: getWidth(18),
            color: Colors.white,
          ),
        ), //getting button text
      ),
    );
  }
}
