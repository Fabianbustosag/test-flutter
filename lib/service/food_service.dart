import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/food_model.dart';

class FoodService{
  final _dio = Dio();

  //Esta funcionando si ocurre un problema es por que el modelo se descofiguro, algun tipo de dato esta malo o algun nulo 
  Future<List<FoodModel>> getFoods() async {
    final response = await _dio.get('http://127.0.0.1:8000/api/food/');
    final foodModel = foodModelFromJsonListDynamic(response.data);
    return foodModel;
    // throw UnimplementedError();
  }

  Future<void> addFood(FoodModel foodModel) async {
    final response = await _dio.post('http://127.0.0.1:8000/api/food/', data: foodModel.toJson(), // Asegúrate de que FoodModel tenga un método toJson()
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Food added successfully');
    } else {
      throw Exception('Failed to add food');
    }
  }


  Future<FoodModel> getFoodById(int id) async {
    final response = await _dio.get('http://127.0.0.1:8000/api/food/${id}/');
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