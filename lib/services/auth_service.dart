import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService {
  //final String baseUrl = 'http://localhost/serviceseasytask/public/api';
  final String baseUrl = 'http://192.168.100.142/myeasytaskservices/public/index.php';

  // Método para registrar un usuario
  Future<Map<String, dynamic>> registerUser(String email, String password, String name) async {
    var url = Uri.parse('$baseUrl/api/register');
    var data = {
      'nombre_usuario': name,
      'correo': email,
      'contrasena': password,
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return {
        'success': true,
        'message': 'User registered successfully',
      };
    } else {
      return {
        'success': false,
        'message': 'Failed to register user',
      };
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    var url = Uri.parse('$baseUrl/api/login');
    var data = {
      'correo': email,
      'contrasena': password,
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    print(data);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      final storage = const FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: jsonResponse['token']);
      print(jsonResponse['token']);
      return {'success': true, 'token': jsonResponse['token']};
    } else {
      return {'success': false, 'message': 'Invalid email or password'};
    }
  }


}