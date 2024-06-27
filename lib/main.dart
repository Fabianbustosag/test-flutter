import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/yes_no_provider.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/screen_foods.dart';
import 'package:flutter_application_1/screens/screen_provider_yes_no_.dart';
import 'package:flutter_application_1/screens/test_yes_no.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => YesNoProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

  

