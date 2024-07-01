import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: TopLanding()),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardProduct(),
                CardProduct(),
                CardProduct()
              ],
            ),
          )
          
          ),
        Center(child: QuestionOne()),
        Center(child: QuestionOne2(),)
        ],
    ));
  }
}

class TopLanding extends StatelessWidget {
  const TopLanding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal:20),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
                color: Colors.blue, // Cambia el color del borde aquí
                width: 3, // Ancho del borde
              ),
      ),
      child: const Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('data'),
          Text('data')
      
        ],
      ),
    );
  }
}

/// La parte de escanear los productos
class QuestionOne extends StatelessWidget {
  const QuestionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal:20),
      width: MediaQuery.of(context).size.width * 0.80,
      height:  MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
                  'Ingresa tus productos aca',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 13, 
                    fontWeight: FontWeight.w400,
                  ),
                ),
          // SizedBox(width: 40,),
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              ),
            
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.crop_free_outlined)
              ),
          )
        ],
      ),
    );
  }
}

class QuestionOne2 extends StatelessWidget {
  const QuestionOne2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal:20),
      width: MediaQuery.of(context).size.width * 0.80,
      height:  MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            children: [
              Text(
                      'Ingresa tus productos aca',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 13, 
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ],
          ),
          // SizedBox(width: 40,),
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              ),
            
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.crop_free_outlined)
              ),
          )
        ],
      ),
    );
  }
}


class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Container(
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
      ),
    );
  }
}
