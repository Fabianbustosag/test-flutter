import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/foods/food_screen.dart';

class CardPublication extends StatelessWidget {

  const CardPublication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String imageUrl = 'http://127.0.0.1:8000/media/media/food_generic_1.png';
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(9),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: imageUrl != null && imageUrl!.isNotEmpty
                          ? Image.network(
                              imageUrl!,
                              height: 100,
                            )
                          : const Placeholder(
                              fallbackHeight: 80,
                              fallbackWidth: 80,
                              color: Colors.grey, // Color del placeholder
                              strokeWidth:
                                  2.0, // Grosor de la línea del placeholder
                            ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize('publication'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          avatar: const Icon(Icons.attach_money),
                          label: Text('precio'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                          ),
                        ),
                        ActionChip(
                          // color: Colors.amber,
                          avatar: const Icon(Icons.location_on),
                          label: Text('Ubicacion'),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(13)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  //solo visualizar la publicacion
                  icon: const Icon(Icons.visibility, color: Colors.white),
                  onPressed: () {
                  // funcion nueva panntalla de detalles de la publicacion
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
