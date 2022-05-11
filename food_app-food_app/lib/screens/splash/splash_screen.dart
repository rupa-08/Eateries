import 'package:flutter/material.dart';
import 'package:food_app/screens/splash/components/body.dart';
import 'package:food_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    //calling starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}