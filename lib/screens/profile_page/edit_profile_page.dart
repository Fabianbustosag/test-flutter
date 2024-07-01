import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/app_routes.dart';
import 'package:flutter_application_1/models/user_data_model.dart';
import 'package:flutter_application_1/screens/profile_page/widgets/text_box_edit_profile.dart';
import 'package:flutter_application_1/service/user_data_service.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EProfilePageState();
}

class _EProfilePageState extends State<EditProfilePage> {
  userDataService service = userDataService();
  late Future<UserDataModel> userDataFuture;

  @override
  void initState() {
    super.initState();
    userDataFuture = _getUserData();
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
   // Editar un campo específico
  Future<void> editField(String field, String initialValue) async {
    String newValue = initialValue;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Text(
          "Editar sección $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Ingresar información de $field",
            hintStyle: const TextStyle(color: Colors.black),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // Botón cancelar
          TextButton(
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // Botón aceptar
          TextButton(
            child: const Text(
              "Guardar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Navigator.of(context).pop(newValue);
              await _updateUserData(field, newValue);
            },
          ),
        ],
      ),
    );
  }

  // Actualizar información del usuario
  Future<void> _updateUserData(String field, String newValue) async {
    try {
      await service.updateUserData(2, {field: newValue});
      setState(() {
        userDataFuture = _getUserData(); // Recargar datos del usuario
      });
    } catch (e) {
      print("Error al actualizar el campo $field: $e");
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
        onPressed: () {
            Navigator.pop(context,AppRoutes.page1); // Navegar hacia atrás al presionar el botón
          },
        ),
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
                    "Informacion de la cuenta",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),

              //Información
              text_box_edit_profile(
                text: userData.nameUser,
                sectionName: "Nombre de usuario",
                onPressed: () => editField("name_user", userData.nameUser),
              ),
              text_box_edit_profile(
                text: userData.biography,
                sectionName: "Biografía",
                onPressed: () => editField("biography", userData.biography),
              ),
              text_box_edit_profile(
                text: userData.phone,
                sectionName: "Teléfono",
                onPressed: () => editField("phone", userData.phone),
              ),
              text_box_edit_profile(
                text: userData.intoleranceAllergies,
                sectionName: "Intolerancias alimenticias",
                onPressed: () => editField("intolerance_allergies", userData.intoleranceAllergies),
              ),
              text_box_edit_profile(
                text: userData.age.toString(),
                sectionName: "Edad",
                onPressed: () => editField("age", userData.age.toString()),
              ),
              text_box_edit_profile(
                text: userData.monthBudget.toString(),
                sectionName: "Presupuesto Mensual",
                onPressed: () => editField("month_budget", userData.monthBudget.toString()),
              ),
              text_box_edit_profile(
                text: userData.homeSize.toString(),
                sectionName: "Cantidad de gente en el hogar",
                onPressed: () => editField("home_size", userData.homeSize.toString()),
              ),
              text_box_edit_profile(
                text: userData.typeCount.toString(),
                sectionName: "Type count",
                onPressed: () => editField("type_count", userData.typeCount.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}