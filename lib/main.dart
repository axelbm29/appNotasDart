import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notas2/screens/pantallaInicio.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


/*
  
  Para home_screen:
    - Poner un fondo de pantalla *********
    - Cargar el fondo, esperar un rato y luego cargar las notas ******
    - Tarjetas con TITULO, FECHA Y HORA (CON ICONOS) *************
    - Tarjetas de una columna de un solo color y la otra, de otro color. CANCELADO
    - Mejorar el botón de ADD. ************
  
  Para note_editor:
    - Creo que nada xd

  Para note_reader:
    - Hacerlo más grande para vizualizarlo 

*/