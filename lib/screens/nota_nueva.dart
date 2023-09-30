import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notas2/style/estilo_app.dart';
import 'package:intl/intl.dart';
import 'package:notas2/widgets/cartas_notas.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {

      
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Agrega una nueva nota",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(Colors.black54),
            ),
        ),
        child: Scrollbar(
          thickness: 8,
          radius: Radius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Título de la Nota',
                    ),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  
                  TextFormField(
                    controller: _mainController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '...',
                    ),
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('d/M/y').format(now);
          String formattedDate2 = DateFormat('jms').format(now);
          await FirebaseFirestore.instance.collection("Notes").add({
              "note_title": _titleController.text,
              "date_creation": formattedDate,
              "hour_creation": formattedDate2,
              "note_content": _mainController.text,
              "color_id": color_id,
            }).then((value) {
              print(value.id);
              Navigator.pop(context);
            }).catchError(
                (error) => print("Falla para agregar una nueva nota a $error"));
        },
        child: Icon(Icons.save_rounded),
      ),
    );
  }
}