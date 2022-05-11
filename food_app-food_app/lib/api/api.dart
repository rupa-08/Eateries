import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ProductDetails {
  //API END POINTS
  String baseUrl = "http://10.0.2.2:8000/store/";
  String userProfile = "http://10.0.2.2:8000/auth/users/";
  String productUrl = "http://10.0.2.2:8000/store/products/";
  String cartUrl =
      "http://10.0.2.2:8000/store/carts/e49b4c2d-1423-4dfb-a21d-91f8e88cab9d/items/";
  String totalUrl =
      "http://10.0.2.2:8000/store/carts/e49b4c2d-1423-4dfb-a21d-91f8e88cab9d/";

//Future method for getting all products from rest
  Future<List> getAllProducts() async {
    try {
      var response = await http.get(Uri.parse(productUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body); //decoading response body
      } else {
        return Future.error('Server Error'); //error if ststus code is not 200
      }
    } catch (e) {
      return Future.error(e);
    }
  }

//Future metho for getting all cart item from rest
  Future<List> getAllCartTotal() async {
    try {
      var response = await http.get(Uri.parse(cartUrl)); //parsing url
      if (response.statusCode == 200) {
        return jsonDecode(response.body); //decoading response body
      } else {
        return Future.error('Server Error'); //error if ststus code is not 200
      }
    } catch (e) {
      return Future.error(e);
    }
  }

//Future method for deleting cart item
  Future deleteItem(String id) async {
    var response = await http.delete(
      Uri.parse(
          "http://10.0.2.2:8000/store/carts/e49b4c2d-1423-4dfb-a21d-91f8e88cab9d/items/$id/"),
      headers: {
        'Content-Type': 'application/json',
      },
    ); //API END POINT for delete
    print(response.statusCode.toString() + "response"); //Printing status code
    print(response.toString() + "response");

    return response;
  }

  //Future metho for getting all cart item from rest
  Future<List> getUser() async {
    try {
      var response = await http.get(Uri.parse(productUrl)); //parsing url
      if (response.statusCode == 200) {
        return jsonDecode(response.body); //decoading response body
      } else {
        return Future.error('Server Error'); //error if ststus code is not 200
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
