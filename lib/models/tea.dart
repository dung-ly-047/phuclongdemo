import 'dart:convert';

TeaModel teaModelFromJson(String str) => TeaModel.fromJson(json.decode(str));

class TeaModel {
  final String? name;
  final String? imgUrl;
  final double? price;
  final int? quantity;
  final TeaSize? teaSize;
  final int? sugar;
  final int? ice;
  final Map<String, int>? toppings;

  TeaModel({
    required this.name,
    this.imgUrl,
    required this.price,
    required this.quantity,
    this.teaSize,
    this.sugar,
    this.ice,
    this.toppings,
  });

  factory TeaModel.fromJson(Map<String, dynamic> json) => TeaModel(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        imgUrl: json["imgUrl"],
        teaSize: json["teaSize"],
        sugar: json["sugar"],
        ice: json["ice"],
        toppings: json["toppings"],
      );
}

enum TeaSize {
  S,
  M,
  L,
}

List<int> surgarAmount = [
  100,
  70,
  30,
  0,
];

List<int> iceAmount = [
  100,
  70,
  30,
  0,
];
