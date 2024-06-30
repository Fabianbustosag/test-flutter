import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/yes_no_model.dart';
import 'package:flutter_application_1/service/yes_no_service.dart';


/// Esta Screen Funciona Con un [FutureBuilder] no con provider
class YesNoTest extends StatelessWidget {
  const YesNoTest({super.key});

  @override
  Widget build(BuildContext context) {

    YesNoService yesNoService = YesNoService();

    return FutureBuilder<YesNoModel>(
      future: yesNoService.getYesNoModel(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final yesNo = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Title: ${yesNo.answer}', style: TextStyle(fontSize: 24)),
              Text('Author: ${yesNo.forced}', style: TextStyle(fontSize: 20)),
            ],
          );
        } else {
          return const Text('No data'); // Muestra un mensaje si no hay datosPP
        }
      },
    );
  }
}