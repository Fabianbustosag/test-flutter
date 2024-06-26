import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/food_model.dart';


class FoodModelRepository {
  final _dio = Dio();

  Future<FoodModel> getFoods() async {
    final response = await _dio.get('http://127.0.0.1:8000/api/food/mimodelo');
    final foodModel = FoodModel.fromJson(response.data);

    return foodModel;
  }

}