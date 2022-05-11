import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_up/sign_up_screen.dart';
import 'package:food_app/screens/splash/components/splash_content.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/components/btn.dart';
import 'package:food_app/screens/sign_up/components/or_divider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //setting current page index to 0
  int currentPage = 0;
  //Passing lists of jason data
  List<Map<String, String>> splashData = [
    {
      "txt": "Welcome to Eateries. \n Let's buy food at discounted price.",
      "img": "assests/illustration/illustration 2.webp"
    },
    {
      "txt":
          "We help people connect to the three stores \n of Kathmandu Valley.",
      "img": "assests/illustration/illustration3.webp"
    },
    {
      "txt": "We show easy way purchase food at low price.",
      "img": "assests/illustration/illustration 1.webp"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              //using page view bulider ro display different content for different screen
              child: PageView.builder(
                //changing page value based on selected page
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                //counting length of json data
                itemCount: splashData.length,
                //displaying text and image based on index of page
                itemBuilder: (context, index) => SplashContent(
                  //variable to get static json text
                  txt: splashData[index]['txt'],
                  //variable to get static image
                  img: splashData[index]["img"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // creating dot for each context of splash data
                      children: List.generate(
                        splashData.length,
                        (index) => dot_build(index: index),
                      ),
                    ),
                    const Spacer(flex: 2),
                    //calling btn_ function
                    btn_(
                      //button text
                      sop_txt: "SIGN UP",
                      // navigating to sign up screen when button is pressed
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                    const Spacer(),
                    //calling orDivider function
                    const orDivider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer dot_build({int? index}) {
    return AnimatedContainer(
      duration: animationDuration,
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
