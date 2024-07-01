import 'package:flutter/cupertino.dart';
// import 'package:flutter_application_1/models/yes_no_model.dart';
import 'package:flutter_application_1/service/yes_no_service.dart';

class YesNoProvider extends ChangeNotifier{
  YesNoService yesNoService = YesNoService();

  void getYesNoData() async{
    // YesNoModel yesNoModel = await yesNoService.getYesNoModel();
    notifyListeners();
  }
}