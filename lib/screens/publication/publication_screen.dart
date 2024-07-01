import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/publication_model.dart';
import 'package:flutter_application_1/screens/publication/create_publication_screen.dart';
import 'package:flutter_application_1/screens/publication/my_publicactions_screen.dart';
import 'package:flutter_application_1/screens/publication/widget/card_publication.dart';
import 'package:flutter_application_1/screens/publication/widget/my_filter_publication.dart';
import 'package:flutter_application_1/service/publication_service.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  Widget build(BuildContext context) {

    PublicationService publicationService = PublicationService();

    String imageUrl = 'http://127.0.0.1:8000/media/media/food_generic_1.png';

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.inbox,color: Colors.white)),
          )
        ],
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                MyFilterPublication()
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PublicationModel>>(
              future: publicationService.getPublications(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List publicationModels = snapshot.data!;
                  return ListView.builder(
                    itemCount: publicationModels.length,
                    itemBuilder: (BuildContext context, int index) { 
                      PublicationModel publication = publicationModels[index];
                      int? publId = publication.publId;
                      String namePubl = publication.publName;
                      String publDescp = publication.publDescp ?? 'Sin Descripcion';
                      int? publPrice = publication.publPrice;
                      String publPriceString = publPrice == null ? 'Sin precio' : publPrice.toString(); 
            
            
                      // return Text(publication.publDescp);
                      return CardPublication(imageUrl: imageUrl, namePublication: namePubl,pricePublication: publPriceString, funcDelete: false,publId: publId ,);
            
                     },
                  );
                } else {
                  return const Text('No data'); // Muestra un mensaje si no hay datosPP
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: MyFloatingButtonsPublication(),
    );
  }
}

class MyFloatingButtonsPublication extends StatelessWidget {

  const MyFloatingButtonsPublication({
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
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePublicationScreen()),
            );
            },
            tooltip: "Ingresar",
            heroTag: 'Ingresar',
            child: const Icon(Icons.add),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPublicationScreen()),
            );
          },
          tooltip: "Mis publicaciones",
          heroTag: 'Mis publicaciones',
          child: const Icon(Icons.arrow_forward),
        ),
      ]
    );
  }
}