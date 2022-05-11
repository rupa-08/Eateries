import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home/components/carousel_content.dart';

class carousel_ extends StatefulWidget {
  const carousel_({Key? key}) : super(key: key);

  @override
  _carousel_State createState() => _carousel_State();
}

class _carousel_State extends State<carousel_> {
  //variable for current page  index
  int currentPage = 0;
  //passing static json data
  List<Map<String, String>> splashData = [
    {"img": "assests/carousel/c1.jpg"},
    {"img": "assests/carousel/c2.jpg"},
    {"img": "assests/illustration/illustration1.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 200,
        width: 900,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                //changing image based on the index of image
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  //counting splash data
                  itemCount: splashData.length,
                  //displaying image based on
                  itemBuilder: (context, index) => content_(
                    img: splashData[index]["img"],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => dot_build(index: index),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//animated dot for image carousel
  AnimatedContainer dot_build({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200), // duration for a dot
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
