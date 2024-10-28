import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:toastification/toastification.dart';
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
          Positioned(child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: const Color.fromARGB(228, 255, 255, 255),)),
          Positioned(
            top: 220, 
              child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: const Color.fromARGB(227, 255, 255, 255),
              child: Material(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  onTap: (){
                    print('Clic');
                  },
                  child: DottedBorder(
                    color: const Color.fromRGBO(46, 204, 113,1.0), // Color del borde
                    strokeWidth: 2, // Grosor de los puntos
                    dashPattern: [20, 5], // Tamaño y espacio entre puntos
                    borderType: BorderType.RRect, // Tipo de borde, RRect para esquinas redondeadas
                    radius: const Radius.circular(12), // Radio de las esquinas
                    child: Center(
                      child: Opacity(
                        opacity: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          //color: Colors.white, // Color de fondo del Container
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(30, 108, 25, 0.0)
                            //color: Colors.red
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(radius: 26, backgroundColor:  Color.fromRGBO(46, 204, 113,1.0),child: Icon(Icons.add,color: Colors.white,size: 40,),),
                              const SizedBox(height: 5,),
                              Text('Nuevo Equipo de Trabajo',style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.black),
                        ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
         Positioned(
            bottom: 0,
            child: Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(left: 10,right: 10),
              //padding: EdgeInsets.only(left: 10,right: 10),
              width: MediaQuery.of(context).size.width-20,
              height: MediaQuery.of(context).size.height-370,
              //color: Colors.red,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  taskitem(context),
                  taskitem(context),
                  taskitem(context),
                  taskitem(context),
                  taskitem(context),
                  taskitem(context),
                  taskitem(context)
                ],
              ),
                )
              ),
          /*Positioned(
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
            ),*/
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20,right: 40,bottom: 10,top: 40),
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(26, 26, 36,1.0),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
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
                      foregroundColor: Color.fromRGBO(46, 204, 113,1.0),
                      backgroundColor: const Color.fromRGBO(26, 26, 36,1.0),
                      foregroundStrokeWidth: 8,
                      backgroundStrokeWidth: 8,
                      animation: true,
                      seekSize: 5,
                      seekColor:  Color.fromRGBO(46, 204, 113,1.0),
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
                            'assets/task2.json',
                            width: 400,
                            height: 180,
                            repeat: true,
                            fit: BoxFit.contain,
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
                        Text('Bienvenido!',style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.normal,color: Colors.white),
                        )),
                        Text('gertcode',style: GoogleFonts.montserrat(
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
                            width: 300,
                            height: 160,
                            repeat: true,
                            reverse: true,
                            fit: BoxFit.fill,
                          ),
              ),
            )),
          
        ],
      ),
      /*ßfloatingActionButton: FloatingActionButton(
        onPressed: (){
          toastification.show(
          context: context, // optional if you use ToastificationWrapper
          title: Text('Crear un nuevo grupo'),
          autoCloseDuration: const Duration(seconds: 2),
          );
        },
        child: Icon(Icons.add,size: 40,),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
    );
  }

  Container taskitem(BuildContext context) {
    return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  //color: const Color.fromRGBO(0, 0, 0, 0.867),
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    //padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                    //color: Colors.red,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(32, 31, 32, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child:  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 5,top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                               Text('Team',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 24,color: Colors.white)),),
                              //CircleAvatar(radius: 26,backgroundColor: const Color.fromARGB(255, 109, 88, 135),child: IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: Colors.white,size: 30,),),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.share),iconSize: 30,color: const Color.fromARGB(255, 255, 255, 255),)
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 65, 63, 63),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                padding:  EdgeInsets.only(left: 14,top: 10),
                                child: Text('Equipo Desarrollo PLS',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 18,color: Colors.white)),)
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(46, 204, 113,1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  child: Material(
                                    color: Color.fromRGBO(46, 204, 113,1.0),
                                    borderRadius: BorderRadius.circular(40),
                                    child:  InkWell(
                                      splashColor: Color.fromARGB(187, 166, 104, 199).withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(40),
                                      onTap: (){},
                                      child: Center(
                                        child: Text('Mostrar Tareas',style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),))
                                          )
                                        )
                                    ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
  }
}