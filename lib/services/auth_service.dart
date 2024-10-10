import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://localhost/serviceseasytask/public/api';

  // Método para registrar un usuario
  Future<Map<String, dynamic>> registerUser(String email, String password, String name) async {
    var url = Uri.parse('$baseUrl/register');
    var data = {
      'email': email,
      'password': password,
      'name': name,
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
    var url = Uri.parse('$baseUrl/login');
    var data = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return {'success': true, 'token': jsonResponse['token']};
    } else {
      return {'success': false, 'message': 'Invalid email or password'};
    }
  }


}