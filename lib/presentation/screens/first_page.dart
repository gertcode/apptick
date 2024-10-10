import 'package:apptick/config/routes/app_router.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            /*Image.asset(
              'assets/welcome_image.png', // Asegúrate de tener esta imagen en assets
              height: 200,
            ),*/
            SizedBox(height: 20.0),
            Center(
              child: Text(
                'EasyTask',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'App hecha con amor por @gertcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //primary: Color(0xFF6C63FF), // Color del botón de "Login"
                backgroundColor: Color(0xFF6C63FF),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Acción del botón de Login
                appRouter.push('/login');
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Color(0xFF6C63FF),
                side: BorderSide(color: Colors.white54),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Acción del botón de Sign-up
                appRouter.push('/register');
              },
              child: Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            /*Center(
              child: TextButton(
                onPressed: () {
                  // Acción para "Browse user comments"
                },
                child: Text(
                  'Browse user comments',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),*/
            Spacer(),
          ],
        ),
      ),
    );
  }
}