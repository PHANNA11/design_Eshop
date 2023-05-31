import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  late int code;
  late String name;
  late int qty;
  late double price;
  late String stockStatus;
  late String desription;
  late double rate;
  late double discount;
  late String image;
  late List<dynamic> subImage;
  ProductModel(
      {required this.code,
      required this.name,
      required this.price,
      required this.qty,
      required this.rate,
      required this.discount,
      required this.desription,
      required this.image,
      required this.stockStatus,
      required this.subImage});
  Map<String, dynamic> toJson() {
    return {
      'id': code,
      'name': name,
      'price': price,
      'qty': qty,
      'rating': rate,
      'image': image,
      'stockStatus': stockStatus,
      'discount': discount,
      'subImage': subImage
    };
  }

  ProductModel.fromJson(DocumentSnapshot res)
      : code = res['id'],
        name = res['name'],
        qty = res['qty'],
        price = double.parse(res['price'].toString()),
        rate = double.parse(res['rating'].toString()),
        image = res['image'],
        stockStatus = res['stockStatus'],
        discount = double.parse(res['discount'].toString()),
        subImage = res['subImage'];
}
