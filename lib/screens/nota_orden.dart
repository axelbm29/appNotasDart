import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteOrder extends StatefulWidget {
  const NoteOrder(QueryDocumentSnapshot<Object?> note, {super.key});

  @override
  State<NoteOrder> createState() => _NoteOrderState();
}

class _NoteOrderState extends State<NoteOrder> {
  @override
  Future<Widget?> ordenNota(BuildContext context) async {
    FirebaseFirestore.instance.collection("Notes").orderBy('hour_creation');
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}