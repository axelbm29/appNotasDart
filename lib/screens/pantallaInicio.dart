import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas2/screens/nota_nueva.dart';
import 'package:notas2/screens/nota_lector.dart';
import 'package:notas2/style/estilo_app.dart';
import 'package:notas2/widgets/cartas_notas.dart';
import 'package:animated_background/animated_background.dart';

import 'nota_lector.dart';
import 'nota_nueva.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final particleOptions = ParticleOptions(
      image: Image.asset(
        "images/PARTICULA.png",
      ),
      baseColor: Colors.white,
      spawnOpacity: 0.0,
      opacityChangeRate: 40,
      minOpacity: 0.1,
      maxOpacity: 0.4,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 70.0,
      spawnMinRadius: 7.0,
      spawnMaxRadius: 15.0,
      particleCount: 60,
    );
    return Scrollbar(
      thickness: 8,
      radius: Radius.circular(100),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 105,
          elevation: 0.0,
          backgroundColor: Colors.black.withOpacity(0.4),
          title: Text(
            "Todas las notas",
            style: AppStyle.tituloHome,
          ),
    
          centerTitle: true,
        ),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/FONDO.jpg',
            ),
            fit: BoxFit.cover,
            ),
          ),

    
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: particleOptions,
            ),
            vsync: this,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) { 
                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        
                        if (snapshot.hasData) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: GridView(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 40,
                                  crossAxisSpacing: 30,
                                  childAspectRatio: 1.1,
                                  mainAxisExtent: 140,
                                ),
                                children: snapshot.data!.docs.map((note) => noteCard(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => NoteReaderScreen(note),));
    
                                }, note))
                                .toList(),
                              ),
                            );
                        }
                
                        return Text(
                          "No hay notas",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    
        floatingActionButton: FloatingActionButton(
          backgroundColor:AppStyle.accentColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoteEditorScreen()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}