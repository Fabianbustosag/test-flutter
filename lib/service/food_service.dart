import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/food_model.dart';

class FoodService{
  final _dio = Dio();

  Future<List<FoodModel>> getFoods() async {
    final response = await _dio.get('http://127.0.0.1:8000/api/food/');
    final foodModel = foodModelFromJsonListDynamic(response.data);
    return foodModel;
    // throw UnimplementedError();
  }

  Future<FoodModel> getFoodById(int id) async {
    final response = await _dio.get('http://127.0.0.1:8000/api/food/${id}');
    final foodModel = FoodModel.fromJson(response.data);
    return foodModel;
    // throw UnimplementedError();
  }

  // El delete si funciona
  Future<void> deleteFoodById(int id) async {
    await _dio.delete('http://127.0.0.1:8000/api/food/$id/');
  }

  Future<FoodModel> updateFoodById(int id, FoodModel food) async {
    final response = await _dio.put(
      'http://127.0.0.1:8000/api/food/$id',
      data: food.toJson(),  // Assuming you have a toJson method in FoodModel
    );
    final updatedFood = FoodModel.fromJson(response.data);
    return updatedFood;
  }

  



}