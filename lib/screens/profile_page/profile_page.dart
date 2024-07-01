import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_data_model.dart';
import 'package:flutter_application_1/screens/profile_page/edit_profile_page.dart';
import 'package:flutter_application_1/screens/profile_page/widgets/button_profile.dart';
import 'package:flutter_application_1/screens/profile_page/widgets/text_box_profile.dart';
import 'package:flutter_application_1/service/user_data_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  userDataService service = userDataService();
  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  //Obtener info
  Future<UserDataModel> _getUserData() async {
  try {
    UserDataModel userData = await service.getUserData(2);
    return userData;
  } catch (e) {
    throw Exception('Fallo de la informacion del usuario'); 
    }
  }

  Future<void> deleteAccount() async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context)=> AlertDialog( 
        backgroundColor: Colors.grey,
        title: const Text(
                "Escribir 'Eliminar' para poder eliminar la cuenta",
                style: TextStyle(color: Colors.white)
              ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Escribir aqui",
            hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),

      actions: [ 
        //boton cancelar
        TextButton(
          child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.white),
                ),
          onPressed: () => Navigator.pop(context),
        ),

        //boton aceptar
        TextButton(
          child: const Text(
                  "Borrar Cuenta",
                  style: TextStyle(color: Colors.white),
                ),
          onPressed: () => Navigator.of(context).pop(newValue),
        ),
      ],
      ),
    );

    if(newValue == 'Eliminar'){
      try {
        //eliminar la coleccion relacionada al usuario a eliminar
        // eliminar cuenta y salir
        await service.deleteUserData(2);
      } catch (e) {
        // llenar error
        throw Exception('Fallo al eliminar la cuenta'); 
      }
    }
  }

  userDataService user = userDataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      //Parte de arriba
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: const Color(0xFFEE693E),
      ),

      //Cuerpo de la screen 
      body: FutureBuilder<UserDataModel>(
        future: _getUserData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles.'));
          }

          // Aquí obtienes los datos del usuario
          final userData = snapshot.data!;

          return ListView(
            children: [
              const SizedBox(height: 50),

              const Icon(
                Icons.account_circle,
                size: 72,
                color: Color(0xFFEE693E),
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Center(
                  child: Text(
                    "Detalles de la cuenta públicos",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),

              //Información
              text_box_profile(
                text: userData.nameUser,
                sectionName: "Nombre de usuario",
              ),
              text_box_profile(
                text: userData.biography,
                sectionName: "Biografia",
              ),
              text_box_profile(
                text: userData.phone,
                sectionName: "Telefono",
              ),

              //Modificar el perfil
              const SizedBox(height: 10),
              button_profile(
                text: "Modificar perfil", 
                onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );},
                icon: Icons.info
              ),

              //Cerrar sesion
              const SizedBox(height: 10),
              button_profile(
                text: "Cerrar sesion", 
                onTap: (){},
                icon: Icons.logout,
              ),

              //Eliminar cuenta
              const SizedBox(height: 10),
              button_profile(
                text: "Eliminar cuenta",
                onTap: () => deleteAccount(),
                icon: Icons.delete
              ),

            ],
          );
        },
      ),
    );
  }
}