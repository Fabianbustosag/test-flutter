import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food_model.dart';
import 'package:flutter_application_1/screens/foods/food_screen.dart';
import 'package:flutter_application_1/service/food_service.dart';

class DetailFoodScreen extends StatefulWidget {
  final int foodId;

  const DetailFoodScreen({super.key, required this.foodId});

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  final String defaulText = 'Sin Campo';
  FoodService foodService = FoodService();

  final TextEditingController nameController = TextEditingController();

  void openBox({String? docID, String? title}) {
    String tileDefault = 'Sin titulo';
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title ?? tileDefault) ,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Nombre alimento'),
                  ),
                ],
              ),
              actions: [
                OutlinedButton(onPressed: () {Navigator.pop(context);}, child: const Text('Cancelar')),
                FilledButton(onPressed: () {}, child: const Text('Anadir'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Detalles del alimento',
            style: TextStyle(
              color: Colors.white, // Color del texto
              // fontWeight: FontWeight.bold, // Peso de la fuente en negrita
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<FoodModel>(
        future: foodService.getFoodById(widget.foodId),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            FoodModel foodsModels = snapshot.data!;
            String dateDefault = '00-00-0000';

            FoodModel food = foodsModels;
            int foodId = food.foodId;
            String nameFood = food.foodName;
            int? foodPrice = food.foodPrice ?? 0;
            String price = foodPrice.toString();
            String? category = food.category ?? 'Sin Categoria'; 
            String imageSrc = food.imgSrc;
            String elaborationDate = food.elaborationDate.toString() ?? dateDefault;
            String expirationDate = food.expirationDate.toString() ?? dateDefault;
            String entryDate = food.entryDate.toString() ?? dateDefault;
            String departureDate = food.departureDate.toString() ?? dateDefault;
            String discardDate = food.discardDate.toString() ?? dateDefault;
            String foodAmountG = food.foodAmountG.toString() ?? '0 g';
            int foodState = food.foodState ?? 1;
            String state = foodState.toString();


          return ListView(
            children:  [
              TitleField(editField: (){openBox(title: 'Editar titulo');}, nameField: capitalize(nameFood),),
              AddImageWidget(imgUrl: imageSrc ?? 'http://127.0.0.1:8000/media/media/food_generic_2.png',),
              MyTextField(nameFIeld: 'Categoria', iconData: Icons.arrow_forward_rounded,editField: (){openBox(title: 'Editar categoria');}, textField: category,), //Categoria
              MyTextField(nameFIeld: 'Precio', iconData: Icons.attach_money_outlined,editField: (){openBox(title: 'Editart precio');}, textField: price,), //Precio
              MyTextField(nameFIeld: 'Estado', iconData: Icons.check,editField: (){openBox(title: 'Editar estado');}, textField: state,), //Estado
              MyTextField(nameFIeld: 'Cantidad', iconData: Icons.arrow_forward_rounded,editField: (){openBox(title: 'Editar cantidad');}, textField: foodAmountG,), //Cantidad
              MyTextField(nameFIeld: 'Fecha de vencimiento', iconData: Icons.date_range,editField: (){openBox(title: 'Editar fecha de vencimiento');}, textField: expirationDate,), //vencimiento
              MyTextField(nameFIeld: 'Fecha de entrada', iconData: Icons.date_range,editField: (){openBox(title:'Editar fecha de entrada');}, textField: entryDate,), //entrada
              MyTextField(nameFIeld: 'Notificacion',iconData: Icons.notification_add_outlined,editField: (){openBox(title:'Editar notificacion');}, textField: 'Sin notificacion',), //notificacion
              const SizedBox(height: 10,),
              const ButtonImage()
            ],
          );
          }
          else {
            return const Text('No data');
          }
        }
      ),
    );
  }
}

class AddImageWidget extends StatelessWidget {
  final String imgUrl;
  const AddImageWidget({
    super.key, required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: SizedBox(
          // width: 20,
          height: 150,
          child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // child: Image.asset( 'lib/images/naranja.jpg', height: 100,)),
                  child: Image.network(
                    imgUrl,
                    width: 10,
                  )),
        )
        // child: const SizedBox(
        //   width: 300,
        //   height: 150,
        //   child: Icon(Icons.add_photo_alternate_rounded)
        // ),
      ),
    );
  }
}

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FilledButton.icon(
        onPressed: () {
          // Respond to button press
        },
        icon: const Icon(Icons.add, size: 18),
        label: const Text("Guardar"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white), // Cambia el color de fondo
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.blue), // Cambia el color del texto e icono
          side: MaterialStateProperty.all<BorderSide>(
            // Cambia el color del borde
            const BorderSide(
                color: Colors.blue,
                width: 2), // Aquí puedes cambiar el color y el grosor del borde
          ),
        ),
      ),
    );
  }
}

class TitleField extends StatelessWidget {
  final String nameField;
  final VoidCallback? editField;
  const TitleField({
    super.key, this.editField, required this.nameField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Column(
        children: [
          const Text(
              'Nombre',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
                ),
            ),
          const SizedBox(height: 3,),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            tileColor: Colors.white,
            title: Text(
              nameField ?? 'No funciono',
              style: TextStyle(color: Colors.black),
            ),
            leading: const Icon(
              Icons.restaurant,
              color: Colors.black,
            ),
            trailing: IconButton(
                onPressed: editField ?? (){},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String nameFIeld;
  final String textField;
  final IconData iconData;
  final VoidCallback? editField;

  const MyTextField({
    super.key,
    required this.nameFIeld,
    required this.iconData,
    this.editField, required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              nameFIeld,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
                ),
            ),
          const SizedBox(height: 3,),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Cambia el radio de la esquina
            ),
            tileColor: Colors.blue,
            title: Text(
              textField,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
                
                ),
            ),
            leading: Icon(
              iconData,
              color: Colors.white,
            ),
            trailing: IconButton(
                onPressed: 
                  editField ?? (){},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
