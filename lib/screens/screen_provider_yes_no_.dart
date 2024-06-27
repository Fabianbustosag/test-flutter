import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/yes_no_provider.dart';
import 'package:provider/provider.dart';

class ScreenProviderYesNo extends StatelessWidget {
  const ScreenProviderYesNo({super.key});

  @override
  Widget build(BuildContext context) {
    final yesNoProvider = context.watch<YesNoProvider>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Test'),
        ),
        body:
            ListView.builder(
              itemCount: 10, 
              itemBuilder: (context, index) {
                final yesNo = yesNoProvider.getYesNoData();



                return ListTile(
                  title: Text('Titulo'),
                  subtitle: Text('Sub Titulo'),
                );

              }
            )
          );
  }
}
