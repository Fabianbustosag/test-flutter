import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_data_model.dart';

class userDataService{
  final _dio = Dio();

  //Obtener informacion
  Future<UserDataModel> getUserData(int id) async{
    final response = await _dio.get("http://127.0.0.1:8000/userData/getInfo/${id}/");
    final userData = UserDataModel.fromJson(response.data);
    return userData;
  }
  
  //Eliminar informacion
  Future<void> deleteUserData(int id) async{
    await _dio.delete('http://127.0.0.1:8000/userData/delete/${id}/');
  }
  
  //Actualizar informacion
  Future<void> updateUserData(int id, Map<String, dynamic> updates) async {
    await _dio.put('http://127.0.0.1:8000/userData/update/$id/', data: updates);
  }

} 