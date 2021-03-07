import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/docteur/detailDocteur.dart';

class Medecin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailDocteur()));
      },
      child: Container(
        padding: EdgeInsets.all(20),

        //margin: EdgeInsets.only(left: 5),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Image.asset(
                  "images/vol.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "Dr. Assane Diallo",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Ophtalmologue",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
