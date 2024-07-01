import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePublicationScreen extends StatelessWidget {
  const CreatePublicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Publicaciones',
            style: TextStyle(
              color: Colors.white, // Color del texto
              // fontWeight: FontWeight.bold, // Peso de la fuente en negrita
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: ('Anadir titulo')),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Cambia el radio de la esquina
              ),
              tileColor: Colors.blue,
              title: const Text(
                'Anadir ubicacion',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Cambia el radio de la esquina
              ),
              tileColor: Colors.blue,
              title: const Text(
                'Anadir descripcion',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.reorder,
                color: Colors.white,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Cambia el radio de la esquina
              ),
              tileColor: Colors.blue,
              title: const Text(
                'Anadir tiempo',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.schedule,
                color: Colors.white,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Cambia el radio de la esquina
              ),
              tileColor: Colors.blue,
              title: const Text(
                'Anadir precio',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FilledButton.icon(
              onPressed: () {
                // Respond to button press
              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text("Anadir imagen"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Cambia el color de fondo
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Cambia el color del texto e icono
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
    );
  }
}
