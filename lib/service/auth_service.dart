import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "http://127.0.0.1:8000";

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = data['user'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user));
        return true; // credenciales correctas
      } else {
        print('Fallo, código de error: ${response.statusCode}');
        return false; // credenciales incorrectas
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      return false; // Error
    }
  }

  //para obtener el id del json que entrega la API
  Future<String?> getUserIdFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');

    if (userData != null) {
      final parsedData = jsonDecode(userData);
      return parsedData['id'].toString();
    } else {
      return null; // No hay datos de usuario almacenados
    }
  }
}