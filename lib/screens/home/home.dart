import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile_page/profile_page.dart';
import 'package:flutter_application_1/screens/foods/food_screen.dart';
import 'package:flutter_application_1/screens/landing_page/landing_page.dart';
import 'package:flutter_application_1/screens/publication/publication_screen.dart';
import 'package:flutter_application_1/screens/seguimiento_screen/seguimiento_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.restaurant),
            icon: Icon(Icons.restaurant),
            label: 'Alimentos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.storefront),
            icon: Icon(Icons.storefront),
            label: 'Tienda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.assessment),
            icon: Icon(Icons.bar_chart),
            label: 'Seguimiento',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.perm_identity_rounded),
            label: 'Perfil',
          ),
        ],
      ),
      body: <Widget>[
        // DetailFoodScreen(),
        const LandingPage(),
        FoodScreen(),
        PublicationScreen(),
        SeguimientoScreen(),
        ProfilePage(),

      ][currentPageIndex],
    );
  }
}