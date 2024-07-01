// To parse this JSON data, do
//
//     final publicationModel = publicationModelFromJson(jsonString);

import 'dart:convert';

List<PublicationModel> publicationModelFromJson(String str) => List<PublicationModel>.from(json.decode(str).map((x) => PublicationModel.fromJson(x)));

// Convierte un [List<dynamic>] de Json a List<FoodModel>
List<PublicationModel> publicationModelFromJsonListDynamic(List<dynamic> json) => List<PublicationModel>.from(json.map((x) => PublicationModel.fromJson(x)));


String publicationModelToJson(List<PublicationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicationModel {
    final int publId;
    final int publPrice;
    final String publDescp;
    final int user;
    final int food;

    PublicationModel({
        required this.publId,
        required this.publPrice,
        required this.publDescp,
        required this.user,
        required this.food,
    });

    factory PublicationModel.fromJson(Map<String, dynamic> json) => PublicationModel(
        publId: json["publ_id"],
        publPrice: json["publ_price"],
        publDescp: json["publ_descp"],
        user: json["user"],
        food: json["food"],
    );

    Map<String, dynamic> toJson() => {
        "publ_id": publId,
        "publ_price": publPrice,
        "publ_descp": publDescp,
        "user": user,
        "food": food,
    };
}
