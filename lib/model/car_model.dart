// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

List<CarModel> carModelFromJson(String str) => List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  String name;
  String image;
  int price;
  int number;

  CarModel({
    required this.name,
    required this.image,
    required this.price,
    required this.number,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    name: json["name"],
    image: json["image"],
    price: json["price"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "price": price,
    "number": number,
  };
}
