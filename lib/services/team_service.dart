import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TeamService {
  final String _baseUrl = 'http://192.168.100.142/easytaskapi/public/index.php'; // Cambia esto por tu URL de producción
  final storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> crearEquipo(String nombreEquipo) async {
    String? token = await storage.read(key: 'auth_token');

    if (token == null) {
      return {'status': false, 'message': 'Usuario no autenticado.'};
    }

    final url = Uri.parse('$_baseUrl/equipos');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode({'nombre_equipo': nombreEquipo,'usuario_id': 3}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return {
        'status': true,
        'message': data['message'],
        'equipo_id': data['equipo_id'],
        'codigo_invitacion': data['codigo_invitacion'],
      };
    } else {
      final error = jsonDecode(response.body);
      print(response.body);
      return {'status': false, 'message': error['message'] ?? 'Error al crear el equipo.'};
    }
  }
}