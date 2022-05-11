import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home/components/products/product_details.dart';
import 'package:food_app/api/api.dart';
import 'package:food_app/screens/home/components/models/productModel.dart';

class products extends StatefulWidget {
  //route name for products
  static String routeName = "/products";

  const products({
    Key? key,
  }) : super(key: key);

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  //creating object of ProductDetails type
  ProductDetails product = ProductDetails();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //future buider is used for creating widgets based on the latest snapshot
        child: FutureBuilder<List>(
          //calling api
          future: product.getAllProducts(),
          builder: (context, snapshot) {
            //printing snapshot
            print(snapshot);
            //checking if snapshot has data
            if (snapshot.hasData) {
              return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.3),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 6,
                  ),
                  //calculating sanpshot item length
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, i) {
                    //returning snapshot data to similar project class
                    return similar_product(
                        productID: snapshot.data![i]['id'].toString(),
                        productName: snapshot.data![i]['product_name'],
                        productPrice:
                            snapshot.data![i]['product_price'].toString(),
                        productED:
                            snapshot.data![i]['product_expiry_date'].toString(),
                        Quantity: snapshot.data![i]['quantity'].toString(),
                        Tag: snapshot.data![i]['tag'],
                        Description: snapshot.data![i]['description'],
                        Category: snapshot.data![i]['category'],
                        storeName: snapshot.data![i]['store_name'],
                        storeAddress: snapshot.data![i]['store_address'],
                        storePhone: snapshot.data![i]['store_phone'].toString(),
                        image: snapshot.data![i]['image'].toString());
                  });
            } else {
              //returning text message if there are no data in snapshot
              return const Text(
                'No Data Found',
                style: TextStyle(color: Colors.black),
              );
            }
          },
        ),
      ),
    );
  }
}

class similar_product extends StatelessWidget {
  //variables
  final Product? item;
  final productID;
  final productName;
  final productPrice;
  final productED;
  final Quantity;
  final Tag;
  final Description;
  final Category;
  final storeName;
  final storeAddress;
  final storePhone;
  final image;

//initializing variables
  const similar_product(
      {Key? key,
      this.productName,
      this.productPrice,
      this.productED,
      this.Quantity,
      this.Tag,
      this.Description,
      this.Category,
      this.storeName,
      this.storeAddress,
      this.storePhone,
      this.item,
      this.image,
      this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //returning hero which will help to go from product on grid to product details when pressed
    return Hero(
        tag: new Text("hero 1"),
        child: Material(
            child: InkWell(
                //navigating to product details page
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => product_details(
                        productDetailID: productID,
                        product_detail_name: productName,
                        product_detail_price: productPrice,
                        product_ED: productED,
                        product_detail_quantity: Quantity,
                        product_detail_tag: Tag,
                        product_description: Description,
                        product_detail_category: Category,
                        Store_name: storeName,
                        Store_address: storeAddress,
                        Store_phone: storePhone,
                        product_image: image))),
                //product in gird
                child: GridTile(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(Tag,
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 19)),
                                ],
                              ), // Tag of product
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                child: Image.network(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              ), // Product image
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productName,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ), // Product name
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          "NRs." + productPrice,
                                          style: TextStyle(
                                              color: Colors.redAccent.shade700,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ) // product price
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
