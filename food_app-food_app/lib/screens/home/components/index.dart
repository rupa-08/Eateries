import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/components/policy.dart';
import 'package:food_app/screens/components/help.dart';
import 'package:food_app/screens/home/components/products/products.dart';
import 'package:food_app/screens/home/components/image_carousel.dart';
import 'package:food_app/screens/splash/splash_screen.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class index_ extends StatefulWidget {
  const index_({Key? key}) : super(key: key);

  @override
  _index_State createState() => _index_State();
}

class _index_State extends State<index_> {
  //setting isChecked to false
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //drawer of home page
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(14, 40, 0, 10),
                  child: Text(
                    'Eateries',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.black54,
              ),
              //drawer item to refresh page
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                      child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "General",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.home_outlined,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
                ),
              ),
              // const Divider(
              //   color: Colors.black54,
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     child: Container(
              //         child: Row(
              //       children: const [
              //         Padding(
              //           padding: EdgeInsets.only(left: 30),
              //           child: Text(
              //             "Settings",
              //             style: TextStyle(
              //                 fontSize: 18, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //         Spacer(),
              //         Icon(
              //           Icons.settings,
              //           color: Colors.deepOrange,
              //         ),
              //       ],
              //     )),
              //   ),
              // ),
              const Divider(),
              //drawer menu item for frequently asked question
              InkWell(
                onTap: () {
                  //navigating to frequently asked questions
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => help_body()),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                      child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.help_outline,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
                ),
              ),
              const Divider(
                color: Colors.black54,
              ),

              //drawer menu item for privacy policy
              InkWell(
                onTap: () {
                  //navigating to privacy policy
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const policy()),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                      child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Policies",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.policy,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
                ),
              ),
              const Divider(),

              //drawer menu item for log out
              InkWell(
                onTap: () async {
                  await openDialog();
                  //updating UI based on the user checked value in dialog
                  setState(() {});
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                      child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        //app Bar for home page
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black87, size: 24),
          elevation: 0,
          title: const Text(
            "                  EATERIES",
            style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         // showSearch(
          //         //     context: context,
          //         //     delegate: DataSearch(list: searchList));
          //       },
          //       icon: const Icon(Icons.search, color: Colors.black)),
          // ]
        ),
        body: ListView(
          children: [
            Column(
              children: [
                //calling home page image carousel
                const carousel_(),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        "Products",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //calling products function
                const products()
              ],
            ),
          ],
        ),
      ),
    );
  }

//future method for reconfirming logout
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
                  title: const Text("Do you want to logout?"),
                  content: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      isChecked
                          ? "Yes, I want to log out."
                          : "No, I don't want to log out.",
                      style: const TextStyle(fontSize: 24),
                    ),
                    value: isChecked,
                    //changing checked value
                    onChanged: (isChecked) => setState(() {
                      this.isChecked = isChecked!;
                      this.setState(() {});
                    }),
                  ),
                  //submit button
                  actions: [
                    TextButton(
                        child: const Text("SUBMIT"),
                        onPressed: () => (!isChecked)
                            ? Navigator.of(context).pop()
                            : Navigator.pushNamed(
                                context, SplashScreen.routeName))
                  ])));
}

// class DataSearch extends SearchDelegate<String> {
//   List<dynamic> list;
//   DataSearch({required this.list});

//   final recentproducts = ['Search Products'];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // actions for search field
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // suffix icon the right of search field
//     return IconButton(
//         onPressed: () {
//           //close(context, results);
//         },
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // show some resule baed on the selection

//     return Container(
//         height: 200,
//         width: 200,
//         child: Card(
//           color: Colors.red,
//           child: InkWell(child: Text(query)),
//         ));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     //show when someone searches for something
//     final suggestionList =
//         query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
//     return suggestionList.isEmpty
//          const Center(child: Text('No Data Found'))
//         : ListView.builder(
//             itemBuilder: (context, index) => ListTile(
//                 onTap: () {
//                   query = suggestionList[index];
//                   showResults(context);
//                 },
//                 leading: const Icon(Icons.food_bank_rounded, size: 40),
//                 title: RichText(
//                     text: TextSpan(
//                         text: suggestionList[index].substring(0, query.length),
//                         style: const TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold),
//                         children: [
//                       TextSpan(
//                           text: suggestionList[index].substring(query.length),
//                           style: const TextStyle(
//                               color: Colors.black54,
//                               fontWeight: FontWeight.normal))
//                     ]))),
//             itemCount: suggestionList.length,
//           );
//   }
// }
