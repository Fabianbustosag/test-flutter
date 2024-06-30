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

// Convierte un foodModel to Json
String foodModelToJson2(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    final int foodId;
    final String? category;
    final DateTime? elaborationDate;
    final DateTime? expirationDate;
    final DateTime? entryDate;
    final DateTime? departureDate;
    final int? foodState;
    final String foodName;
    final int? foodPrice;
    final String imgSrc;
    final int? foodAmount;
    final int? consumed;
    final DateTime? possibleExpirationDate;
    final DateTime? discardDate;
    final double? foodAmountG;
    final int user;

    FoodModel({
        required this.foodId,
        this.category,
        this.elaborationDate,
        this.expirationDate,
        this.entryDate,
        this.departureDate,
        this.foodState,
        required this.foodName,
        this.foodPrice,
        required this.imgSrc,
        this.foodAmount,
        this.consumed,
        this.possibleExpirationDate,
        this.discardDate,
        this.foodAmountG,
        required this.user,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        foodId: json["food_id"],
        category: json["category"],
        elaborationDate: json["elaboration_date"] == null ? null : DateTime.parse(json["elaboration_date"]),
        expirationDate: json["expiration_date"] == null ? null : DateTime.parse(json["expiration_date"]),
        entryDate: json["entry_date"] == null ? null : DateTime.parse(json["entry_date"]),
        departureDate: json["departure_date"] == null ? null : DateTime.parse(json["departure_date"]),
        foodState: json["food_state"],
        foodName: json["food_name"],
        foodPrice: json["food_price"],
        imgSrc: json["img_src"],
        foodAmount: json["food_amount"],
        consumed: json["consumed"],
        possibleExpirationDate: json["possible_expiration_date"] == null ? null : DateTime.parse(json["possible_expiration_date"]),
        discardDate: json["discard_date"] == null ? null : DateTime.parse(json["discard_date"]),
        foodAmountG: json["food_amount_g"],
        user: json["user"],
    );

    // Map<String, dynamic> toJson() => {
    //     "food_id": foodId,
    //     "category": category,
    //     "elaboration_date": "${elaborationDate!.year.toString().padLeft(4, '0')}-${elaborationDate!.month.toString().padLeft(2, '0')}-${elaborationDate!.day.toString().padLeft(2, '0')}",
    //     "expiration_date": "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}",
    //     "entry_date": "${entryDate!.year.toString().padLeft(4, '0')}-${entryDate!.month.toString().padLeft(2, '0')}-${entryDate!.day.toString().padLeft(2, '0')}",
    //     "departure_date": "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
    //     "food_state": foodState,
    //     "food_name": foodName,
    //     "food_price": foodPrice,
    //     "img_src": imgSrc,
    //     "food_amount": foodAmount,
    //     "consumed": consumed,
    //     "possible_expiration_date": "${possibleExpirationDate!.year.toString().padLeft(4, '0')}-${possibleExpirationDate!.month.toString().padLeft(2, '0')}-${possibleExpirationDate!.day.toString().padLeft(2, '0')}",
    //     "discard_date": "${discardDate!.year.toString().padLeft(4, '0')}-${discardDate!.month.toString().padLeft(2, '0')}-${discardDate!.day.toString().padLeft(2, '0')}",
    //     "food_amount_g": foodAmountG,
    //     "user": user,
    // };

        Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "category": category,
        "elaboration_date": elaborationDate != null
            ? "${elaborationDate!.year.toString().padLeft(4, '0')}-${elaborationDate!.month.toString().padLeft(2, '0')}-${elaborationDate!.day.toString().padLeft(2, '0')}"
            : null,
        "expiration_date": expirationDate != null
            ? "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}"
            : null,
        "entry_date": entryDate != null
            ? "${entryDate!.year.toString().padLeft(4, '0')}-${entryDate!.month.toString().padLeft(2, '0')}-${entryDate!.day.toString().padLeft(2, '0')}"
            : null,
        "departure_date": departureDate != null
            ? "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}"
            : null,
        "food_state": foodState,
        "food_name": foodName,
        "food_price": foodPrice,
        "img_src": imgSrc,
        "food_amount": foodAmount,
        "consumed": consumed,
        "possible_expiration_date": possibleExpirationDate != null
            ? "${possibleExpirationDate!.year.toString().padLeft(4, '0')}-${possibleExpirationDate!.month.toString().padLeft(2, '0')}-${possibleExpirationDate!.day.toString().padLeft(2, '0')}"
            : null,
        "discard_date": discardDate != null
            ? "${discardDate!.year.toString().padLeft(4, '0')}-${discardDate!.month.toString().padLeft(2, '0')}-${discardDate!.day.toString().padLeft(2, '0')}"
            : null,    
        "food_amount_g": foodAmountG,
        "user": user,
    };

}
