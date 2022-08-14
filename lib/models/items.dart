// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

// class Items {
//   String name;
//   int price;
//   int actualprice;
//   int quantity;
//   String category;
//   Items({
//     required this.name,
//     required this.price,
//     required this.actualprice,
//     required this.quantity,
//     required this.category,
//   });

//   factory Items.initial() {
//     return Items(name: '', price: 0, actualprice: 0, quantity: 0, category: '');
//   }

//   // factory Items.fromDoc(QuerySnapshot userDoc) {
//   //   final userData = userDoc as Map<String, dynamic>?;
//   //   return Items(
//   //       name: userData!['name'],
//   //       price: userData['price'],
//   //       actualprice: userData['actualprice'],
//   //       category: userData['category']);
//   // }
//   Items copyWith({
//     String? name,
//     int? price,
//     int? actualprice,
//     int? quantity,
//     String? category,
//   }) {
//     return Items(
//       name: name ?? this.name,
//       price: price ?? this.price,
//       actualprice: actualprice ?? this.actualprice,
//       quantity: quantity ?? this.quantity,
//       category: category ?? this.category,
//     );
//   }

//   @override
//    String toString() {
//     return 'Items(name: $name, price: $price, actualprice: $actualprice, quantity: $quantity, category: $category)';
//   }

//     factory Items.fromJson(Map<String, dynamic> json) => Items(

//         name: json["name"],
//         price: json["price"],
//         actualprice: json["cost_price"],
//         quantity: json["quantity"],
//         category: json["category"],

//     );
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'price': price,
//       'actualprice': actualprice,
//       'quantity': quantity,
//       'category': category,
//     };
//   }

// }
// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str)["data"]);

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    required this.name,
    required this.price,
    required this.actualPrice,
    required this.quantity,
    required this.category,
    required this.id,
    required this.v,
  });

  String name;
  int price;
  int actualPrice;
  int quantity;
  String category;
  String id;
  int v;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: json["name"],
        price: json["price"],
        actualPrice: json["cost_price"],
        quantity: json["quantity"],
        category: json["category"],
        id: json["_id"],
        v: json["__v"],
      );

  factory Items.initial() {
    return Items(
        name: '',
        price: 0,
        actualPrice: 0,
        quantity: 0,
        category: '',
        id: '',
        v: 0);
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "cost_price": actualPrice,
        "quantity": quantity,
        "category": category,
        "_id": id,
        "__v": v,
      };
}
