// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

// Convierte un [Json] a una [List<FoodModel>]
List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

// Convierte un [List<dynamic>] de Json a List<FoodModel>
List<FoodModel> foodModelFromJsonListDynamic(List<dynamic> json) => List<FoodModel>.from(json.map((x) => FoodModel.fromJson(x)));

// Convierte una [List<FoodModel>] a un Json 
String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    final int foodId;
    final String categoty;
    final DateTime elaborationDate;
    final DateTime expirationDate;
    final DateTime entryDate;
    final DateTime departureDate;
    final int foodState;
    final String foodName;
    final int foodPrice;
    final String imgSrc;
    final int foodAmount;
    final int consumed;
    final DateTime possibleExpirationDate;
    final int user;

    FoodModel({
        required this.foodId,
        required this.categoty,
        required this.elaborationDate,
        required this.expirationDate,
        required this.entryDate,
        required this.departureDate,
        required this.foodState,
        required this.foodName,
        required this.foodPrice,
        required this.imgSrc,
        required this.foodAmount,
        required this.consumed,
        required this.possibleExpirationDate,
        required this.user,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        foodId: json["food_id"],
        categoty: json["categoty"],
        elaborationDate: DateTime.parse(json["elaboration_date"]),
        expirationDate: DateTime.parse(json["expiration_date"]),
        entryDate: DateTime.parse(json["entry_date"]),
        departureDate: DateTime.parse(json["departure_date"]),
        foodState: json["food_state"],
        foodName: json["food_name"],
        foodPrice: json["food_price"],
        imgSrc: json["img_src"],
        foodAmount: json["food_amount"],
        consumed: json["consumed"],
        possibleExpirationDate: DateTime.parse(json["possible_expiration_date"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "categoty": categoty,
        "elaboration_date": "${elaborationDate.year.toString().padLeft(4, '0')}-${elaborationDate.month.toString().padLeft(2, '0')}-${elaborationDate.day.toString().padLeft(2, '0')}",
        "expiration_date": "${expirationDate.year.toString().padLeft(4, '0')}-${expirationDate.month.toString().padLeft(2, '0')}-${expirationDate.day.toString().padLeft(2, '0')}",
        "entry_date": "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "departure_date": "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
        "food_state": foodState,
        "food_name": foodName,
        "food_price": foodPrice,
        "img_src": imgSrc,
        "food_amount": foodAmount,
        "consumed": consumed,
        "possible_expiration_date": "${possibleExpirationDate.year.toString().padLeft(4, '0')}-${possibleExpirationDate.month.toString().padLeft(2, '0')}-${possibleExpirationDate.day.toString().padLeft(2, '0')}",
        "user": user,
    };
}
