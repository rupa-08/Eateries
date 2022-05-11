import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/cart/components/proceed.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class product_details extends StatefulWidget {
  //variables
  final productDetailID;
  final product_detail_name;
  final product_detail_price;
  final product_ED;
  final product_detail_quantity;
  final product_detail_tag;
  final product_description;
  final product_detail_category;
  final Store_name;
  final Store_address;
  final Store_phone;
  final product_image;

  //iniatializing variables
  const product_details({
    Key? key,
    this.product_detail_name,
    this.product_detail_price,
    this.product_ED,
    this.product_detail_quantity,
    this.product_detail_tag,
    this.product_description,
    this.product_detail_category,
    this.Store_name,
    this.Store_address,
    this.Store_phone,
    this.product_image,
    this.productDetailID,
  }) : super(key: key);

  @override
  _product_detailsState createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
  int _quantity = 0;

  void setQuantity(bool isIncrement) {
    int checkQuantity(int quantity) {
      if (quantity < 0) {
        return 0;
      } else if (quantity > 5) {
        return 5;
      } else {
        return quantity;
      }
    }

    if (isIncrement) {
      print("increment");
      _quantity = checkQuantity(_quantity + 1);
    } else {
      print("decrement");
      _quantity = checkQuantity(_quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ), // Page title
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              //navigating to previous page
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ), //leading icon
      ), // app bar for product details
      body: ListView(children: <Widget>[
        Container(
          height: 250.0,
          child: GridTile(
              header: Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.product_detail_tag,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                          fontStyle: FontStyle.italic,
                          fontSize: 22)), //Product tag
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                child: Image.network(widget.product_image), // product image
              ),
              footer: Container(
                  color: Colors.white,
                  child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 190),
                        child: Text(widget.product_detail_name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 20)), // product name
                      ),
                      title: Row(children: <Widget>[
                        Expanded(
                          child: Text("Nrs. " + widget.product_detail_price,
                              style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        )
                      ]) //Product price
                      ))),
        ),
        Container(
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Product Details",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Category: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.product_detail_category,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //product category
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Avilable quantity: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.product_detail_quantity,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //quantity
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Description: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.product_description,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //product description
                const Text("Store Details",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Store name: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.Store_name,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //store name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Address: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.Store_address,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //Store address
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Phone Number: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(widget.Store_phone,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18)),
                    ],
                  ),
                ), //Store phone number
              ],
            ),
          ),
        ),
        Row(
          children: [
            Spacer(),
            IconButton(
                onPressed: () {
                  addToCart();
                }, //adding to cart when pressed
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.redAccent.shade700,
                ))
          ],
        ),
        const check_out() //checking out
      ]),
    );
  }

//method to add in cart
  void addToCart() {
    postCart(widget.productDetailID, widget.product_detail_quantity);
  }

//method to delete from cart
  void deleteFromCart() {}

//future method to post in cart
  Future postCart(String id, String quantity) async {
    try {
      var response = await http.post(
          Uri.parse(
              "http://10.0.2.2:8000/store/carts/a6260032-7c5e-4f94-85ee-520afa74552c/items/"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode(
              {'product_id': id, 'quantity': quantity})); // api endpoint

      print(response.body.toString() + "response"); //returning response body
      return response.body;
    } catch (e) {
      return Future.error(e); // exception
    }
  }

//future method to delete from cart
  Future deleteCartItem(String id, String quantity) async {
    try {
      var response = await http.delete(
          Uri.parse(
              "http://10.0.2.2:8000/store/carts/9626b080-c326-4079-8687-654651db365b/"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({'product_id': id, 'quantity': quantity})); // api

      print(response.body.toString() + "response");
      return response.body; //returning response body
    } catch (e) {
      return Future.error(e); // exception
    }
  }
}
