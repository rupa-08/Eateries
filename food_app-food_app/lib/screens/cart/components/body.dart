import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api/api.dart';
import 'package:http/http.dart' as http;

class cart_item extends StatefulWidget {
  const cart_item({Key? key}) : super(key: key);

  @override
  _cart_itemState createState() => _cart_itemState();
}

class _cart_itemState extends State<cart_item> {
  //object of ProductDetails type
  ProductDetails product = ProductDetails();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            //future buider is used for creating widgets based on the latest snapshot
            child: FutureBuilder<List>(
                //calling api
                future: product.getAllCartTotal(),
                builder: (context, snapshot) {
                  print(snapshot.data); //printing snapshot data
                  //checking if snapshot has data
                  if (snapshot.hasData) {
                    return ListView.builder(
                        //calculating sanpshot item length
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          //returning snapshot data to similar cart item class
                          return Single_cart_item(
                            cart_prod_id:
                                snapshot.data![index]['id'].toString(),
                            cart_prod: snapshot.data![index]['product'],
                            prod_total_price:
                                snapshot.data![index]['total_price'].toString(),
                            cart_prod_quantity:
                                snapshot.data![index]["quantity"].toString(),
                          );
                        });
                  } else {
                    //reeturning text message if there are no data in snapshot
                    return const Center(
                      child: Text('No Data Found'),
                    );
                  }
                })));
  }
}

class Single_cart_item extends StatefulWidget {
  //variables
  final cart_prod_id;
  final cart_prod;
  final cart_prod_quantity;
  final prod_total_price;

//initializing variables
  Single_cart_item(
      {this.cart_prod_id,
      this.cart_prod,
      this.cart_prod_quantity,
      this.prod_total_price});

  @override
  State<Single_cart_item> createState() => _Single_cart_itemState();
}

class _Single_cart_itemState extends State<Single_cart_item> {
  @override
  Widget build(BuildContext context) {
    ProductDetails product = ProductDetails();
    return Card(
        child: ListTile(
      title: Row(
        children: [
          Text("ID: "),
          Text(widget.cart_prod_id,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              )),
        ],
      ), //product id
      subtitle: Column(
        children: <Widget>[
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text("Quantity: "),
              Text(
                widget.cart_prod_quantity,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ), //Quntity
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text("\$${widget.cart_prod}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ), //Cart Product
          Row(
            children: [
              Text("Total Price: Nrs."),
              Text(widget.prod_total_price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      product.deleteItem(widget.cart_prod_id);
                    });
                  },
                  child: Icon(Icons.remove))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    ));
  }
}
