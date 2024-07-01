import 'package:flutter/material.dart';

class CreateFoodScreen extends StatefulWidget {
  const CreateFoodScreen({super.key});

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
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
      body: ListView(
        children:  [
          TitleField(editField: (){openBox(title: 'Editar titulo');},),
          const AddImageWidget(),
          MyTextField(nameFIeld: 'Categoria', iconData: Icons.arrow_forward_rounded,editField: (){openBox(title: 'Editar categoria');},),
          MyTextField(nameFIeld: 'Precio', iconData: Icons.attach_money_outlined,editField: (){openBox(title: 'Editart precio');}),
          MyTextField(nameFIeld: 'Estado', iconData: Icons.check,editField: (){openBox(title: 'Editar estado');}),
          MyTextField(nameFIeld: 'Cantidad', iconData: Icons.arrow_forward_rounded,editField: (){openBox(title: 'Editar cantidad');}),
          MyTextField(nameFIeld: 'Fecha de vencimiento', iconData: Icons.date_range,editField: (){openBox(title: 'Editar fecha de vencimiento');}),
          MyTextField(nameFIeld: 'Fecha de entrada', iconData: Icons.date_range,editField: (){openBox(title:'Editar fecha de entrada');}),
          MyTextField(nameFIeld: 'Notificacion',iconData: Icons.notification_add_outlined,editField: (){openBox(title:'Editar notificacion');}),
          const SizedBox(height: 10,),
          const ButtonImage()
        ],
      ),
    );
  }
}

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: const SizedBox(
          width: 300,
          height: 150,
          child: Icon(Icons.add_photo_alternate_rounded)
        ),
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
        label: const Text("Anadir imagen"),
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
  final VoidCallback? editField;
  const TitleField({
    super.key, this.editField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        tileColor: Colors.white,
        title: const Text(
          'Nombre del alimento',
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
    );
  }
}

class MyTextField extends StatelessWidget {
  final String nameFIeld;
  final IconData iconData;
  final VoidCallback? editField;

  const MyTextField({
    super.key,
    required this.nameFIeld,
    required this.iconData,
    this.editField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Cambia el radio de la esquina
        ),
        tileColor: Colors.blue,
        title: Text(
          nameFIeld,
          style: const TextStyle(color: Colors.white),
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
    );
  }
}
