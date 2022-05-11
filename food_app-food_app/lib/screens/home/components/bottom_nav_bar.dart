import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home/components/index.dart';
import 'package:food_app/screens/cart/cart_screen.dart';
import 'package:food_app/screens/profile/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //current page index
  int currentIndex = 0;

//setting current page index to 0
  setCurrentPageIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

// tabs to displayed based on page index
  final tabs = [profile(), index_(), cart_screen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ), //IndexedStack shows stack where only one component is shown at one time by its index
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setCurrentPageIndex(0); //current page index to 0
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currentIndex == 0
                          ? Colors.orange.shade200
                          : Colors
                              .white), //orange color when current index is 0
                  child: Row(
                    children: [
                      const Icon(Icons.home_filled,
                          color: primaryColor), // icon
                      const SizedBox(
                        width: 10,
                      ),
                      currentIndex == 0
                          ? const Text(
                              "Home",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ) //Icon text
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setCurrentPageIndex(1); //current page index to 1
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currentIndex == 1
                          ? Colors.orange.shade200
                          : Colors
                              .white), //orange color when current index is 1
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_bag_rounded,
                          color: primaryColor), //icon
                      const SizedBox(
                        width: 10,
                      ),
                      currentIndex == 1
                          ? const Text(
                              "Cart",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     setCurrentPageIndex(2);
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: currentIndex == 2
              //             ? Colors.orange.shade200
              //             : Colors.white),
              //     child: Row(
              //       children: [
              //         const Icon(Icons.feed, color: primaryColor),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         currentIndex == 2
              //             ? const Text(
              //                 "Items",
              //                 style:
              //                     TextStyle(color: primaryColor, fontSize: 15),
              //               )
              //             : const SizedBox()
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  setCurrentPageIndex(2); //current page index to 2
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currentIndex == 2
                          ? Colors.orange.shade200
                          : Colors
                              .white), //orange color when current index is 2
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: primaryColor), //icon
                      const SizedBox(
                        width: 10,
                      ),
                      currentIndex == 2
                          ? const Text(
                              "Profile",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ) //Icon text
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
