import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food_model.dart';
import 'package:flutter_application_1/service/food_service.dart';



/// Esta Screen Funciona Con un [FutureBuilder] no con provider
class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {

    FoodService foodService = FoodService();

    return Scaffold(
      body: FutureBuilder<List<FoodModel>>(
        future: foodService.getFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List foodsModels = snapshot.data!;
            return ListView.builder(
              itemCount: foodsModels.length,
              itemBuilder: (BuildContext context, int index) { 
                FoodModel food = foodsModels[index];
                return Text(food.foodName);
      
               },
            );
          } else {
            return const Text('No data'); // Muestra un mensaje si no hay datosPP
          }
        },
      ),
    );
  }
}