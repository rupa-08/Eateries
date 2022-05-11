//model for product image
class Product {
  final String imgUrl;

  Product(this.imgUrl);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(json['imgUrl']);
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json['imgUrl']);
  }
}
