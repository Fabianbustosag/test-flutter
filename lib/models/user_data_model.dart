// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    String intoleranceAllergies;
    int homeSize;
    String nameUser;
    int age;
    int monthBudget;
    int userId;
    int typeCount;
    String biography;
    String phone;

    UserDataModel({
        required this.intoleranceAllergies,
        required this.homeSize,
        required this.nameUser,
        required this.age,
        required this.monthBudget,
        required this.userId,
        required this.typeCount,
        required this.biography,
        required this.phone
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        intoleranceAllergies: json["intolerance_allergies"],
        homeSize: json["home_size"],
        nameUser: json["name_user"],
        age: json["age"],
        monthBudget: json["month_budget"],
        userId: json["user_id"],
        typeCount: json["type_count"],
        biography: json["biography"],
        phone: json["phone"]
    );

    Map<String, dynamic> toJson() => {
        "intolerance_allergies": intoleranceAllergies,
        "home_size": homeSize,
        "name_user": nameUser,
        "age": age,
        "month_budget": monthBudget,
        "user_id": userId,
        "type_count": typeCount,
        "biography": biography,
        "phone":phone
    };
    @override
  String toString() {
    return 'UserDataModel(intoleranceAllergies: $intoleranceAllergies, homeSize: $homeSize, nameUser: $nameUser, age: $age, monthBudget: $monthBudget, userId: $userId, typeCount: $typeCount,biography:$biography,phone: $phone)';
  }
}
