import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/food_service.dart';
import 'package:flutter_application_1/service/yes_no_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final YesNoService yesNoService = YesNoService();
  final FoodService foodService = FoodService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          Text('answer:'),
          Text('data')
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
              // yesNoService.getYesNoModel();
              // foodService.getFoods();
              // foodService.getFoodById(5);
              foodService.deleteFoodById(5);
          }),
    );
  }
}
