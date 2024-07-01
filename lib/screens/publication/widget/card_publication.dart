import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/foods/food_screen.dart';
import 'package:flutter_application_1/screens/message/message_screen.dart';
import 'package:flutter_application_1/service/publication_service.dart';

class CardPublication extends StatelessWidget {
  final int? publId;
  final String namePublication;
  final String? pricePublication;
  final String? imageUrl;
  final String? locationPublication;
  final VoidCallback? funcCreate;
  final bool? funcDelete;
  final bool? sendMessage;

  const CardPublication({
    super.key,
    required this.imageUrl,
    required this.namePublication,
    this.pricePublication,
    this.locationPublication,
    this.funcCreate,
    this.funcDelete,
    required this.publId,
    this.sendMessage,
  });

  @override
  Widget build(BuildContext context) {
    // String imageUrl = 'http://127.0.0.1:8000/media/media/food_generic_1.png';
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
                          capitalize(namePublication),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          avatar: const Icon(Icons.attach_money),
                          label: Text(pricePublication ?? 'Sin precio'),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        ActionChip(
                          // color: Colors.amber,
                          avatar: const Icon(Icons.location_on),
                          label: Text(locationPublication ?? 'Sin ubicacion'),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
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
            child: Column(
              children: [
                if (funcDelete ==
                    true) // reemplaza 'condition' con tu condición
                  IconButton(
                    // solo visualizar la publicacion
                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                    onPressed: () {
                      // funcion nueva pantalla de detalles de la publicacion
                      // funcDelete;
                      PublicationService publicationService =
                          PublicationService();
                      publicationService.deletePublicationById(publId!);
                    },
                  ),
                if (sendMessage ==
                    true) // reemplaza 'condition' con tu condición
                  IconButton(
                    // solo visualizar la publicacion
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // funcion nueva pantalla de detalles de la publicacion
                      // funcDelete;
                      // PublicationService publicationService =
                      //     PublicationService();
                      // publicationService.deletePublicationById(publId!);
                                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen()),
                      );

                    },
                  ),
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
