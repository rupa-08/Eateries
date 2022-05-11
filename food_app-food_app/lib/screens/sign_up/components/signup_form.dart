import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/sign_in/sign_in_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  //creating local variable to store user credentials
  late String _name, address, phone, email;
  //text editing controller for user password
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

//global key to uniquely identify element
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

//validating user data
  validate() {
    if (formkey.currentState!.validate()) {
      //displaying sign in screen if user data are valid
      return Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      //printing not validate when user data are invalid
      print("Not validate");
    }
  }

//creating tokenKey variable
  String? _tokenKey;

//future method to post user credentials in backend
  Future<bool> _authenticate() async {
    //printing user credentials
    print(_name);
    print(_password.text);
    print(email);
    print(address);
    print(phone);

    try {
      //api location for user registration
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/registration/'),
        //headers that the end point accepts
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        //encoding user credentials
        body: json.encode(
          {
            "username": _name,
            "password": _password.text,
            "email": email,
            "first_name": address,
            "last_name": phone
          },
        ),
      );
      //decoading response body
      final responseData = json.decode(response.body);
      //printing response data
      print(responseData);
      //throwing exception if status code is greater than or equal to 400
      if (response.statusCode >= 400) {
        throw HttpException(responseData['non_field_errors'][0]);
      }
      //delaying by 1 second
      await Future.delayed(const Duration(seconds: 1));
      _tokenKey = responseData['access'];
      //returning true when token key is obtained
      return true;
    } catch (error) {
      //returning false if token key is false
      _tokenKey = null;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formkey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          //User name text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              onSaved: (name) {
                _name = name!;
              }, //saving value entered by user in username text field
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
                hintText: "Enter username",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              //validating if user name field is empty.
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter username";
                }
                return null;
              },
            ),
          ),

          SizedBox(height: SizeConfig.screenHeight * 0.04),
          //Password text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              controller: _password,
              onSaved: (_password) {
                _password = _password;
              }, //saving value entered by user in password text field
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                suffixIcon: const Icon(
                  Icons.visibility,
                  color: iconColor,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Password",
                hintText: "Enter password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              //validating if password field is empty
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
            ),
          ),

          SizedBox(height: SizeConfig.screenHeight * 0.04),
          //Confirm Password textfield
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              controller: _confirmpassword,
              onSaved: (_confirmpassword) {
                _confirmpassword = _confirmpassword;
              }, //saving value entered by user in confirm password text field
              obscureText: true, //hiding user password
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                suffixIcon: const Icon(
                  Icons.visibility_off,
                  color: iconColor,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Confirm password",
                hintText: "Re-enter your password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter re-enter password.";
                }
                if (_password.text != _confirmpassword.text) {
                  return "Password don't match";
                } //checking if password matches with confirm password
                return null;
              }, //validating confirm password for empty field and unmatched password
            ),
          ),

          SizedBox(height: SizeConfig.screenHeight * 0.04),
          //Email text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                suffixIcon: const Icon(
                  Icons.email,
                  color: iconColor,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Email",
                hintText: "Enter email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              //validating email field
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                } //displaying error when email field is empty
                if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+\.[a-z]+")
                    .hasMatch(value)) {
                  return "Please provide valid email.";
                } //checking if provided email is valid
                return null;
              }, //validating email for rmpty field and checking is provided email is valid
              onSaved: (value) {
                email = value!;
              }, //saving user entered value in email field
            ),
          ),

          SizedBox(height: SizeConfig.screenHeight * 0.04),
          //User first name text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Address",
                hintText: "Enter your address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your address";
                } //checking if address field is empty
                return null;
              }, //validating if address field is empty
              onSaved: (value) {
                address = value!;
              }, //saving user address
            ),
          ),

          SizedBox(height: SizeConfig.screenHeight * 0.04),
          //User last name text field
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              cursorColor: Colors.deepOrangeAccent,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                labelText: "Phone number",
                hintText: "Enter your phone number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone number";
                } // checking if user phone number fiel is empty
                return null;
              },
              onSaved: (value) {
                phone = value!;
              }, //saving user last name
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),

          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 2.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              //sign up button
              child: ElevatedButton(
                child: const Text("SIGN UP",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                //providing shape to a button
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () async {
                  //validating form
                  validate();
                  //saving data when user is validated
                  formkey.currentState!.save();
                  bool value = await _authenticate();
                  //Error message when user is not registered
                  final snackBar = SnackBar(
                      content: Text(
                    'Sorry, Registration was unsuccessful.',
                    style: TextStyle(fontSize: 18),
                  ));
                  //successful message when user is registered
                  final snackBarTwo = SnackBar(
                      content: Text(
                    'Congrulations!!, Registration was successful.\n Now, you can login.',
                    style: TextStyle(fontSize: 18),
                  ));
                  (!value)
                      //displaying message when user is not registered
                      ? Scaffold.of(context).showSnackBar(snackBar)
                      //displaying message when user is registered
                      : Scaffold.of(context).showSnackBar(snackBarTwo);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
