import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Text('data'),
              Text('data')

            ],
          ),

        ),
        Center(child: CardProduct())
        ],
    ));
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //imagen
          Image.network(
            'http://127.0.0.1:8000/media/media/food_generic_3.png',
            height: 140,
          ),
          //texto
          const Text(
            'alimento.nombre',
          ),
          //fecha de vencimiento
          const SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vence en 3 dias',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 26, 25, 25),
                        fontSize: 20))
              ],
            ),
          )
        ],
      ),
    );
  }
}
