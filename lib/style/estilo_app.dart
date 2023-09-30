import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  
  static Color bgColor = Color(0xFFe2e2ef);
  static Color mainColor = Color(0xFF15616d);
  static Color accentColor = Color.fromARGB(255, 197, 217, 63);

  static List<Color> cardsColor = [
    Colors.yellow.shade100,
  ];

  static TextStyle tituloHome = GoogleFonts.roboto(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle tituloCartas = GoogleFonts.roboto(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,

  );

  static TextStyle tituloReader = GoogleFonts.roboto(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
    
  static TextStyle contenidoHome = GoogleFonts.nunito(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle contenidoCartas = GoogleFonts.nunito(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle contenidoReader = GoogleFonts.nunito(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle fecha = GoogleFonts.roboto(
    fontSize: 13.0,
    fontWeight: FontWeight.bold,
  );
}