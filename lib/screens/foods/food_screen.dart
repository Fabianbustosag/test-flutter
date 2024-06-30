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
                // return Text(food.foodName);
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElemetList(),
                );
      
               },
            );
          } else {
            return const Text('No data'); // Muestra un mensaje si no hay datosPP
          }
        },
      ),
      floatingActionButton: const MyFloatingButtons()
    );
  }
}

class MyFloatingButtons extends StatelessWidget {
  const MyFloatingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            onPressed: () => {},
            heroTag: "fab1",
            child: const Icon(Icons.add),
          ),
        ),
        FloatingActionButton(
          onPressed: () => {},
          heroTag: "fab2",
          child: const Icon(Icons.crop_free_rounded),
        ),
      ]
    );
  }
}

class ElemetList extends StatelessWidget {
  const ElemetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue),
      child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset( 'lib/images/naranja.jpg', height: 100,)),
                const SizedBox( width: 20,),
                const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('nombreProducto'),
                        Text('categoria'),
                  ],
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete))
              ],
      ),
    );
  }
}