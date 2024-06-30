import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/yes_no_model.dart';

class YesNoService{
  final _dio = Dio();
  Future<YesNoModel> getYesNoModel() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel;

    throw UnimplementedError();
  }



}