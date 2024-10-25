// pages/crear_equipo_page.dart
import 'package:apptick/services/team_service.dart';
import 'package:flutter/material.dart';


class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreEquipoController = TextEditingController();
  bool _isLoading = false;
  final TeamService _equipoService = TeamService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nuevo Equipo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nombreEquipoController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Equipo',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa el nombre del equipo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _crearEquipo,
                      child: const Text('Crear Equipo'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _crearEquipo() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final nombreEquipo = _nombreEquipoController.text;
      final result = await _equipoService.crearEquipo(nombreEquipo);

      setState(() {
        _isLoading = false;
      });

      if (result['status']) {
        // Mostrar mensaje de éxito y navegar o actualizar la interfaz
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Equipo Creado'),
            content: Text('Código de Invitación: ${result['codigo_invitacion']}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cerrar el diálogo
                  Navigator.pop(context); // Volver a la pantalla anterior
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      } else {
        // Mostrar mensaje de error
        print(result['message']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    }
  }

  @override
  void dispose() {
    _nombreEquipoController.dispose();
    super.dispose();
  }
}