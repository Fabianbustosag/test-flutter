import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/publication_model.dart';
import 'package:flutter_application_1/service/publication_service.dart';

class PublicationScreen extends StatelessWidget {
  const PublicationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    PublicationService publicationService = PublicationService();

    return Scaffold(
      body: FutureBuilder<List<PublicationModel>>(
        future: publicationService.getPublications(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List publicationModels = snapshot.data!;
            return ListView.builder(
              itemCount: publicationModels.length,
              itemBuilder: (BuildContext context, int index) { 
                PublicationModel publication = publicationModels[index];
                return Text(publication.publDescp);
      
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