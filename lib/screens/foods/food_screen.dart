import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food_model.dart';
import 'package:flutter_application_1/screens/foods/widget/date_picker.dart';
import 'package:flutter_application_1/service/food_service.dart';



/// Esta Screen Funciona Con un [FutureBuilder] no con provider
class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {

  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2= TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();
  final TextEditingController textController5 = TextEditingController();

  void deleteBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Desea eliminar?'),
              // content: const Text('Necesita ingresar todos los campos!'),
              actions: <Widget>[
                FilledButton(
                  onPressed: () => Navigator.pop(context, 'Cancelar'),
                  child: const Text('Cancelar'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Aca va la funcion de eliminar
                    Navigator.pop(context, 'Eliminar');
                  },
                  child: const Text('Eliminar'),
                )
              ],
            ));
  }

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
              controller: textController1,
              decoration: InputDecoration(labelText: 'Nombre alimento'),
            ),
            TextField(
              controller: textController2,
              decoration: InputDecoration(labelText: 'Categoria'),
            ),
            TextField(
              controller: textController3,
              decoration: InputDecoration(labelText: 'Fecha de vencimiento'),
            ),
            TextField(
              controller: textController4,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            TextField(
              controller: textController5,
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
          ],
        ),
        actions: [
          FilledButton(
              onPressed: () {
                textController1.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          FilledButton(
            onPressed: () {Navigator.pop(context);},
            child: const Text('Anadir'))
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {

    FoodService foodService = FoodService();

    return Scaffold(
      appBar: AppBar(
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
                String nameFood = food.foodName;
                String? category = food.category ?? 'Sin Categoria'; // Si la categoria da null entonces devuelve Sin categoria
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElemetList(nameFood: nameFood, category: category, deleteBox: () { deleteBox(); },),
                );
      
               },
            );
          } else {
            return const Text('No data'); // Muestra un mensaje si no hay datosPP
          }
        },
      ),
      floatingActionButton: MyFloatingButtons(ingresar: (){openBox();},)
    );
  }
}

class ElemetList extends StatelessWidget {
  final String nameFood;
  final String category;
  final VoidCallback deleteBox;

  const ElemetList({
    super.key, required this.nameFood, required this.category, required this.deleteBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue),
      child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset( 'lib/images/naranja.jpg', height: 100,)),
                ),
                const SizedBox( width: 20,),
                Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(capitalize(nameFood),  style: const TextStyle(color: Colors.white, ),),
                        Text(category,  style: const TextStyle(color: Colors.white, ),),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: IconButton(
                      onPressed: deleteBox,
                      icon: const Icon(Icons.delete,color: Color.fromARGB(255, 231, 226, 226),)),
                )
              ],
      ),
    );
  }
}

class MyFloatingButtons extends StatelessWidget {
  final VoidCallback ingresar;

  const MyFloatingButtons({
    super.key, required this.ingresar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            onPressed: ingresar,
            heroTag: "ingresar",
            child: const Icon(Icons.add),
          ),
        ),
        FloatingActionButton(
          onPressed: () => {},
          heroTag: "escanear",
          child: const Icon(Icons.crop_free_rounded),
        ),
      ]
    );
  }
}

String capitalize(String s) {
  if (s.isEmpty) {
    return s; // Devuelve el string vacío si no hay caracteres
  }
  return s[0].toUpperCase() + s.substring(1); // Convierte la primera letra a mayúscula y concatena el resto del string
}