import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Barra de estado transparente
        statusBarIconBrightness: Brightness.dark, // Iconos oscuros en la barra de estado
      ),
    );
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(36, 36, 49, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE0ECFF), // Fondo transparente
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/done.png'), // Imagen del avatar
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texto "Hello, Robert"
            const Text(
              'Hello,',
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            const Text(
              'Robert',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 20),
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            // Texto "Your Task"
            const Text(
              'Your Task',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Botones de progreso
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProgressButton('In Progress', true),
                _buildProgressButton('To-Do', false),
                _buildProgressButton('Completed', false),
              ],
            ),
            const SizedBox(height: 20),
            // Lista de tarjetas de tareas
            Expanded(
              child: ListView(
                children: [
                  _buildTaskCard(
                    title: 'The Infinite Project',
                    progress: 60,
                    startDate: '05 Aug 2023',
                    endDate: '20 Aug 2023',
                    comments: 4,
                    avatars: ['avatar1.png', 'avatar2.png'],
                    priority: 'High',
                  ),
                  _buildTaskCard(
                    title: 'Operation Quantum Leap',
                    progress: 25,
                    startDate: '20 Nov 2023',
                    endDate: '28 Nov 2023',
                    comments: 4,
                    avatars: ['avatar3.png', 'avatar4.png'],
                    priority: 'Moderate',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      )
    );
  }

  // Botón de progreso
  Widget _buildProgressButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.grey,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    required int progress,
    required String startDate,
    required String endDate,
    required int comments,
    required List<String> avatars,
    required String priority,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etiqueta "Design"
            const Text(
              'Design',
              style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            // Título del proyecto
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Barra de progreso
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Text('$progress%'),
              ],
            ),
            const SizedBox(height: 10),
            // Fecha y comentarios
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14),
                    const SizedBox(width: 5),
                    Text(startDate),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, size: 14),
                    const SizedBox(width: 10),
                    Text(endDate),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment, size: 14),
                    const SizedBox(width: 5),
                    Text('$comments Comments'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Avatares y prioridad
            Row(
              children: [
                // Avatares de los miembros del equipo
                Stack(
                  children: avatars.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String avatar = entry.value;
                    return Positioned(
                      left: idx * 20.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/$avatar'),
                        radius: 15,
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                Chip(
                  label: Text(priority),
                  backgroundColor: priority == 'High' ? Colors.redAccent : Colors.orangeAccent,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}