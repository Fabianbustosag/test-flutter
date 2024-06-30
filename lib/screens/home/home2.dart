import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/food_service.dart';
import 'package:flutter_application_1/service/yes_no_service.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {
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
