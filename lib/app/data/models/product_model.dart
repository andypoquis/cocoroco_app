// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.name,
    this.price,
    this.quantityAlert,
    this.totalQuantity,
    this.withTicket,
  });

  String? name;
  String? price;
  int? quantityAlert;
  int? totalQuantity;
  bool? withTicket;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        quantityAlert:
            json["quantityAlert"] == null ? null : json["quantityAlert"],
        totalQuantity:
            json["totalQuantity"] == null ? null : json["totalQuantity"],
        withTicket: json["withTicket"] == null ? null : json["withTicket"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "quantityAlert": quantityAlert == null ? null : quantityAlert,
        "totalQuantity": totalQuantity == null ? null : totalQuantity,
        "withTicket": withTicket == null ? null : withTicket,
      };
}
