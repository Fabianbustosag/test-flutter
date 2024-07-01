import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food_model.dart';
import 'package:flutter_application_1/screens/foods/detail_food.dart';
import 'package:flutter_application_1/screens/images/image_screen.dart';
import 'package:flutter_application_1/service/food_service.dart';
import 'package:intl/intl.dart';

/// Esta Screen Funciona Con un [FutureBuilder] no con provider
class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  FoodService foodService = FoodService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController foodAmountController = TextEditingController();

  // Funcion showDialog para agregar una nueva nota en la base de datos
  void openBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Anadir alimento'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Nombre alimento'),
                  ),
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(labelText: 'Categoria'),
                  ),
                  TextField(
                    controller: expirationDateController,
                    decoration: const InputDecoration(
                        labelText: 'Fecha de vencimiento'),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Precio'),
                  ),
                  TextField(
                    controller: foodAmountController,
                    decoration: const InputDecoration(labelText: 'Cantidad'),
                  ),
                ],
              ),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      nameController.clear();
                      categoryController.clear();
                      expirationDateController.clear();
                      priceController.clear();
                      foodAmountController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () {
                      int foodId =
                          1; // el foodId da igual, pero lo puse requiered hay que cambiarlo
                      String foodName = nameController.text;
                      String imgSrc =
                          'http://127.0.0.1:8000/media/media/food_generic_2.png'; // hay que poner la url de una archivo subido a static
                      int user = 1; // hay que cambiarlo
                      String category = categoryController.text;
                      int foodPrice = int.parse(priceController.text);
                      int foodAmount = int.parse(foodAmountController.text);
                      String dateString = "2023-06-30";
                      // String date = '10-10-2000';

                      String expirationDateString =
                          expirationDateController.text;

                      // Parse the input date string
                      DateTime parsedDate =
                          DateFormat('dd-MM-yyyy').parse(expirationDateString);

                      // Format the date to yyyy-MM-dd format
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(parsedDate);

                      DateTime? expirationDate = DateTime.parse(formattedDate);

                      FoodModel newFood = FoodModel(
                        foodId: foodId,
                        foodName: foodName,
                        imgSrc: imgSrc,
                        user: user,
                        category: category,
                        foodPrice: foodPrice,
                        foodAmount: foodAmount,
                        expirationDate: expirationDate,
                      );

                      // FoodModel newFood = FoodModel(
                      //   foodId: 1,
                      //   foodName: 'foodName',
                      //   imgSrc: 'imgSrc',
                      //   user: 1,
                      //   category: 'category',
                      //   foodPrice: 1000,
                      //   foodAmount: 1,
                      //   // expirationDate: expirationDate,
                      // );

                      foodService.addFood(newFood);

                      Navigator.pop(context);
                    },
                    child: const Text('Anadir'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white)),
            )
          ],
          title: const Center(
            child: Text(
              'Mis Alimentos',
              style: TextStyle(
                color: Colors.white, // Color del texto
                // fontWeight: FontWeight.bold, // Peso de la fuente en negrita
              ),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder<List<FoodModel>>(
          future: foodService.getFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List foodsModels = snapshot.data!;
              return ListView.builder(
                itemCount: foodsModels.length,
                itemBuilder: (BuildContext context, int index) {
                  FoodModel food = foodsModels[index];
                  int foodId = food.foodId;
                  String nameFood = food.foodName;
                  String? category = food.category ??
                      'Sin Categoria'; // Si la categoria da null entonces devuelve Sin categoria
                  String imageSrc = food.imgSrc;
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElemetList(
                      imgSrc: imageSrc,
                      nameFood: nameFood,
                      category: category,
                      foodId: foodId,
                    ),
                  );
                },
              );
            } else {
              return const Text(
                  'No data'); // Muestra un mensaje si no hay datosPP
            }
          },
        ),
        floatingActionButton: MyFloatingButtons(
          ingresar: () {
            openBox();
          },
        ));
  }
}

class ElemetList extends StatefulWidget {
  final String imgSrc;
  final String nameFood;
  final String category;
  final int foodId;

  const ElemetList({
    super.key,
    required this.nameFood,
    required this.category,
    required this.foodId,
    required this.imgSrc,
  });

  @override
  State<ElemetList> createState() => _ElemetListState();
}

class _ElemetListState extends State<ElemetList> {
  final String imgGeneric =
      'http://127.0.0.1:8000/media/media/food_generic_2.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.blue),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // child: Image.asset( 'lib/images/naranja.jpg', height: 100,)),
                child: Image.network(
                  widget.imgSrc,
                  width: 100,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                capitalize(widget.nameFood),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                widget.category,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      FoodService().deleteFoodById(widget.foodId);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Color.fromARGB(255, 231, 226, 226),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailFoodScreen(foodId: widget.foodId,)),
                      );
                      // FoodService().deleteFoodById(widget.foodId);
                    },
                    icon: const Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 231, 226, 226),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyFloatingButtons extends StatefulWidget {
  final VoidCallback ingresar;

  const MyFloatingButtons({
    super.key,
    required this.ingresar,
  });

  @override
  State<MyFloatingButtons> createState() => _MyFloatingButtonsState();
}

class _MyFloatingButtonsState extends State<MyFloatingButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: FloatingActionButton(
          onPressed: widget.ingresar,
          heroTag: "Ingresar",
          tooltip: 'Ingresar',
          child: const Icon(Icons.add),
        ),
      ),
      FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImagePickerDemo()),
          );
        },
        // backgroundColor: const Color.fromARGB(255, 169, 215, 253), // Color de fondo
        // foregroundColor: Colors.white,
        tooltip: "Escanear",
        heroTag: "Escanear",
        child: const Icon(Icons.crop_free_rounded),
      ),
    ]);
  }
}

String capitalize(String s) {
  if (s.isEmpty) {
    return s; // Devuelve el string vacío si no hay caracteres
  }
  return s[0].toUpperCase() +
      s.substring(
          1); // Convierte la primera letra a mayúscula y concatena el resto del string
}
