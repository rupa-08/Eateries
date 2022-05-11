import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  //global key to uniquely identify element
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
//validating user data
  validate() {
    if (formkey.currentState!.validate()) {
      //displaying home screen if user data are valid
      return Navigator.pushNamed(context, home_page.routeName);
    } else {
      //printing not validate when user data are invalid
      print("Not validate");
    }
  }

//validatepass function of string type for validation
  String? validatepass(value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Should not be more than 15 characters";
    } else {
      return null;
    }
  }

//route name for sign in
  static String routeName = "/sign_in";

  //creating private variable to store user credentials and token
  String? _tokenKey;
  String? _usernameField;
  String? _userPassword;

  //future method to post token
  // return type: bool represents if the method executed successfully.
  Future<bool> _authenticate(String username, String password) async {
    try {
      //api location for token
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/token/'),
        //headers that the end point accepts
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        //encoding user credentials
        body: json.encode(
          {
            "username": username,
            "email": "",
            "password": password,
          },
        ),
      );
      //decoading response body
      final responseData = json.decode(response.body);
      print(responseData);
      //throwing exception if status code is greater than or equal to 400
      if (response.statusCode >= 400) {
        throw HttpException(responseData['non_field_errors'][0]);
      }
      //delaying by 1 second
      await Future.delayed(const Duration(seconds: 1));
      _tokenKey = responseData['access'];
      return true;
      //returning true when token key is obtained
    } catch (error) {
      _tokenKey = null;
      return false;
      //returning false if token key is false
    }
  }

//future method to authenticate user name and password
  Future<void> login(String username, String password) async =>
      await _authenticate(username, password);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formkey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),

          //Username text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              onSaved: (value) {
                _usernameField = value;
              }, //saving value from username field
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                suffixIcon: const Icon(
                  Icons.person,
                  color: iconColor,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Username",
                hintText: "Enter your username",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: "Required*"),
              ]), //required validation
            ),
          ),

          //User password text field
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
                onSaved: (value) {
                  _userPassword = value;
                }, //saving value from password field
                cursorColor: Colors.deepOrangeAccent,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: iconColor,
                    size: 30,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                  labelText: "Password",
                  hintText: "Enter your password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: validatepass
                //validating user password by calling validatepass function
                ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 2.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              //sign in button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () async {
                  formkey.currentState!.save();
                  //saving current form state
                  print(_userPassword);
                  print(_usernameField);
                  //printing user password and username
                  final snackBar = const SnackBar(
                      content: Text(
                    'Sorry, LogIn is unsuccessful.',
                    style: TextStyle(fontSize: 18),
                  )); //displaying error message when user login is unsuccessful

                  bool value =
                      await _authenticate(_usernameField!, _userPassword!);
                  //providing user name and password in _authenticate functiton
                  (!value)
                      ? Scaffold.of(context).showSnackBar(
                          snackBar) // calling sank bar when user is not authenticated
                      : validate(); //validating user
                },
                child: const Text("SIGN IN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("RESET PASSWORD"),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new password',
              ),
            ),
            rounded_button()
          ],
        ),
      ),
    );
  }
}

class rounded_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () {},
          //validate,
          //(){Navigator.pushNamed(context, okScreen.routeName);},
          child:
              const Text("Reset password", style: TextStyle(color: txtColor)),
        ),
      ),
    );
  }
}
