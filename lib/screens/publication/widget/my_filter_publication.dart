import 'package:flutter/material.dart';

class MyFilterPublication extends StatelessWidget {
  const MyFilterPublication({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // Ordenar
        Chip(
          shape: StadiumBorder(
            side: BorderSide(color: Colors.black26)
          ),
          avatar: Icon(Icons.swap_vert),
          label: Text('Ordenar por'),
        ),
        SizedBox(width: 10,),
        // Categorias
        Chip(
          shape: StadiumBorder(
            side: BorderSide(color: Colors.black26)
          ),
          avatar: Icon(Icons.restaurant),
          label: Text('Categorias'),
        ),
                SizedBox(width: 10,),
        // Categorias
        // Chip(
        //   shape: StadiumBorder(
        //     side: BorderSide(color: Colors.black26)
        //   ),
        //   avatar: Icon(Icons.location_on),
        //   label: Text('Ubicacion'),
        // ),
        //         SizedBox(width: 10,),
        // // Categorias
        // Chip(
        //   shape: StadiumBorder(
        //     side: BorderSide(color: Colors.black26)
        //   ),
        //   avatar: Icon(Icons.watch_later),
        //   label: Text('Tiempo'),
        // ),

      ],
    );
  }
}
