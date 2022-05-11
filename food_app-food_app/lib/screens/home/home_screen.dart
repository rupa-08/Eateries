import 'package:flutter/material.dart';
import 'package:food_app/screens/home/components/bottom_nav_bar.dart';

class home_page extends StatefulWidget {
  //routename for home page
  static String routeName = "/home";
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // calling BottomBar in scaffold body
      body: BottomBar(),
    );
  }
}
