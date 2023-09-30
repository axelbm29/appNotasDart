import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notas2/style/estilo_app.dart';


Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {

  Icon fecha = Icon(Icons.calendar_today);
  Icon hora = Icon(Icons.watch);
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: AppStyle.tituloCartas,
            maxLines: 1,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "Creado:",
            style: AppStyle.fecha,
          ),
          SizedBox(
            height: 8.0,
          ),
          
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              fecha,
              Text("  " + doc["date_creation"]),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              hora,
              Text("  " + doc["hour_creation"]),
            ],
          ),
        ],
      ),
    ),
  );
}