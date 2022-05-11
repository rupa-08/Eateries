import 'package:flutter/widgets.dart';
import 'package:food_app/screens/payment/payment_screen.dart';
import 'package:food_app/screens/profile/profile_screen.dart';
import 'package:food_app/screens/selected_payment/cash_pay/body.dart';
import 'package:food_app/screens/selected_payment/khalti_pay/body.dart';
import 'package:food_app/screens/sign_up/sign_up_screen.dart';
import 'package:food_app/screens/splash/splash_screen.dart';
import 'package:food_app/screens/sign_in/sign_in_screen.dart';
import 'package:food_app/screens/home/home_screen.dart';

//mapping all the route names of appication
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  home_page.routeName: (context) => home_page(),
  payment_.routeName: (context) => payment_(),
  cash_pay.routeName: (context) => cash_pay(),
  khalti_pay.routeName: (context) => khalti_pay(),
  profile.routeName: (context) => profile(),
};
