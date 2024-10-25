import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    final ValueNotifier<double> valueNotifier = ValueNotifier(0);


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 130),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height:300, 
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(52, 73, 94,1.0),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0),bottomLeft: Radius.circular(40.0))
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 1, // width ÷ height
                    valueNotifier: valueNotifier,
                    progress: 60,
                    maxProgress: 100,
                    corners: StrokeCap.butt,
                    foregroundColor: Colors.blue,
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundStrokeWidth: 20,
                    backgroundStrokeWidth: 20,
                    animation: true,
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: valueNotifier,
                        builder: (_, double value, __) => Text(
                          '${value.toInt()}%',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 180,
                    child: Text('¡Buenos días!',style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                    ),),
                  ),
                  Positioned(
                    left: 10,
                    top: 210,
                    child: Text('gertcode',style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                    ),),
                  )
                ],
              ),
              ),
            )
        ],
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: FloatingActionButton(
      backgroundColor: const Color(0xFF6C63FF),
      onPressed: (){},
      child: const Icon(Icons.add)),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: const Color(0xFF0D0D15),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.close_rounded),
          label: 'Salir',
        ),
      ]),
    );
  }
}

