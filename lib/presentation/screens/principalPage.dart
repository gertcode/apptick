import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {

    final ValueNotifier<double> valueNotifier = ValueNotifier(0);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: const Color.fromRGBO(26, 26, 36,0.9),)),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              //padding: EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width-20,
              height: MediaQuery.of(context).size.height-220,
              //color: Colors.red,
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Número de columnas en la cuadrícula
              crossAxisSpacing: 10.0, // Espacio horizontal entre elementos
              mainAxisSpacing: 10.0, // Espacio vertical entre elementos
              childAspectRatio: 3.5, // Relación de aspecto para cada celda
            ),
            itemCount: 8, // Número de elementos en la cuadrícula
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 20,right: 20),
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(26, 26, 36,0.6),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 40.0,child: Image.asset('assets/grupo-de-trabajo.png',width: 50,),), 
                    const SizedBox(width: 15,),                 
                      Expanded(
                        child: Text(
                        'Este es un texto largo aohsdf aslhda slkdhask ajksdhask',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // Muestra "..." si el texto es muy largo
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.white),
                                            )     ),
                      )           
                    ],
                ),
                
                );
            },
          ),
                )
              ),
          Positioned(
            bottom: 20,
            child: Container(
                width: MediaQuery.of(context).size.width-80,
                height: 80,
                margin: const EdgeInsets.only(left: 40,right: 40),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(26, 26, 36,1.0),
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                    icon: const Icon(Icons.close_fullscreen_rounded), // El ícono que se muestra
                    color: Colors.red,           // El color del ícono
                    iconSize: 50.0,              // Tamaño del ícono
                    tooltip: 'Añadir a favoritos', // Texto de ayuda al mantener el cursor sobre el botón
                    onPressed: () {
                      print('Botón de favorito presionado');
                          },
                    )
                  ],
                ),
              ),
            ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20,right: 40,bottom: 10,top: 40),
              width: MediaQuery.of(context).size.width,
              height: 260,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(26, 26, 36,1.0),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
              ),
              child: Row(
                children: [
                  SizedBox(
                    //color: Colors.red,
                    height: 120,width: 120,child: Stack(
                    children: [
                      Positioned(child: DashedCircularProgressBar.aspectRatio(
                      aspectRatio: 1, // width ÷ height
                      valueNotifier: valueNotifier,
                      progress: 80,
                      startAngle: 0,
                      sweepAngle:360,
                      foregroundColor: Colors.green,
                      backgroundColor: const Color.fromRGBO(26, 26, 36,1.0),
                      foregroundStrokeWidth: 8,
                      backgroundStrokeWidth: 8,
                      animation: true,
                      seekSize: 5,
                      seekColor:  Colors.green,
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: valueNotifier,
                          builder: (_, double value, __) => const Column(
                            mainAxisSize: MainAxisSize.min,
                          )
                        ),
                      ),
                    )
                    ),
                      Positioned(left: 12,top: 12,child: 
                      CircleAvatar(radius: 48,child:Lottie.asset(
                            'assets/avatar.json',
                            width: 400,
                            height: 180,
                            repeat: false,
                            fit: BoxFit.fill,
                          ),backgroundColor: const Color.fromARGB(255, 121, 119, 121),) ,)
                    ],
                  ),),
                  SizedBox(
                    //color: Colors.blue, 
                    height: 150,
                    width: MediaQuery.of(context).size.width-180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bienvenido!',style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.normal,color: Colors.white),
                        )),
                        Text('gertcode',style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.normal,color: Colors.white),
                    )),
                  ],),)
                ],
              )
                    ,
            )
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.5,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 121, 119, 121), // Cambia este color a tu preferencia
                  BlendMode.srcATop,
                ),
                child: Lottie.asset(
                            'assets/animation.json',
                            width: 400,
                            height: 180,
                            repeat: true,
                            reverse: true,
                            fit: BoxFit.fill,
                          ),
              ),
            )),
          
        ],
      ),
    );
  }
}