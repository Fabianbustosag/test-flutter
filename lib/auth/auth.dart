import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_or_register.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/service/auth_service.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: AuthService().getUserIdFromApi(), //id desde la ip
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); 
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              // Hay un ID válido
              return const Home();
            } else {
              // No hay un ID válido
              return LoginOrRegister();
            }
          }
        },
      ),
    );
  }
}
