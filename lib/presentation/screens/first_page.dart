import 'package:apptick/config/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          /*Positioned(
            top: 250,
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.red,
            ) 
        ),*/
          Positioned(
            bottom: 0,
            child:  Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Opacity(
                opacity: 1,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(46, 204, 113,1), // Cambia este color a tu preferencia
                    BlendMode.srcATop,
                  ),
                  child: Lottie.asset(
                              'assets/animation3.json',
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              repeat: true,
                              //reverse: true,
                              fit: BoxFit.fill,
                            ),
                ),
              ),
            ),
        ),
        Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Center(
              child: Text(
                'EasyTask',
                style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500,color: Color.fromARGB(255, 75, 75, 75)),),
              ),
            ),
            const SizedBox(height: 20.0),
            Image.asset('assets/tarea.png',width: 100,height: 100,),
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'App hecha con amor por @gertcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            Material(
              color: Color.fromRGBO(46, 204, 113,1.0),
              borderRadius: BorderRadius.circular(40),
                child:  InkWell(
                splashColor: Color.fromARGB(187, 166, 104, 199).withOpacity(0.3),
                borderRadius: BorderRadius.circular(40),
                onTap: (){
                  appRouter.push('/login');
                },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text('Login',style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),))
                                  ),
                  )
                            )
            ),
            const SizedBox(height: 20.0),
            Material(
              color: Color.fromRGBO(46, 204, 113,1.0),
              borderRadius: BorderRadius.circular(40),
                child:  InkWell(
                splashColor: Color.fromARGB(187, 166, 104, 199).withOpacity(0.3),
                borderRadius: BorderRadius.circular(40),
                onTap: (){
                  appRouter.push('/register');
                },
                  child: Container(
                    height: 60,
                    child: Center(
                      child: Text('Registro',style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),))
                                  ),
                  )
                            )
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      )
        ],
      )
      
      /*Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Text(
                'EasyTask',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'App hecha con amor por @gertcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //primary: Color(0xFF6C63FF), // Color del botón de "Login"
                backgroundColor: const Color(0xFF6C63FF),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Acción del botón de Login
                appRouter.push('/login');
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                side: const BorderSide(color: Colors.white54),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Acción del botón de Sign-up
                appRouter.push('/register');
              },
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),*/
    );
  }
}