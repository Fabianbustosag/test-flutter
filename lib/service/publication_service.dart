import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/publication_model.dart';

class PublicationService{
  final _dio = Dio();

  Future<List<PublicationModel>> getPublications() async {
    final response = await _dio.get('http://127.0.0.1:8000/api/publication/');
    final publicationModel = publicationModelFromJsonListDynamic(response.data);
    return publicationModel;
    // throw UnimplementedError();
  }

  Future<PublicationModel> getPublicationById(int id) async {
    final response = await _dio.get('http://127.0.0.1:8000/api/publication/${id}');
    final publicationModel = PublicationModel.fromJson(response.data);
    return publicationModel;
    // throw UnimplementedError();
  }

  // El delete si funciona
  Future<void> deletePublicationById(int id) async {
    await _dio.delete('http://127.0.0.1:8000/api/publication/$id/');
  }

  Future<PublicationModel> updatepublicationById(int id, PublicationModel publication) async {
    final response = await _dio.put(
      'http://127.0.0.1:8000/api/food/$id',
      data: publication.toJson(),  // Assuming you have a toJson method in PublicationModel
    );
    final updatedPublication = PublicationModel.fromJson(response.data);
    return updatedPublication;
  }

}