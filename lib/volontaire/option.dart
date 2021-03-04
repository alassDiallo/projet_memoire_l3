import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/couleurs.dart';

class Fonctionalite extends StatelessWidget {
  String text;
  Widget icon;
  String nombre;
  Fonctionalite({this.text, this.icon, this.nombre});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 16, bottom: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.topRight, child: icon),
            Text(nombre,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor)),
            Text(text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: secondaryTextColor))
          ],
        ),
      ),
    );
  }
}
