import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/routes.dart';
import 'package:food_app/screens/splash/splash_screen.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:native_notify/native_notify.dart';

//main function to run application
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing native notify
  NativeNotify.initialize(443, 'hbCMRbm807SqLchymbmb2a');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //returning khslti scope to integrate khalti api
    return KhaltiScope(
        publicKey: "test_public_key_b02bc119f850442d8c477ac44f28b7dd",
        builder: (context, navigatorKey) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            //removing debug
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            //main theme of application
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: "Muli",
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: txtColor),
                  bodyText2: TextStyle(color: txtColor)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // routeName so that we dont need to remember the name
            //rotue for first screen
            initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        });
  }
}
