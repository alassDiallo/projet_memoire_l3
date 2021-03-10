import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gestion_materiel_cmu/docteur/detailDocteur.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';

class DocteurCategorie extends StatelessWidget {
  Medecin medecin;
  DocteurCategorie({this.medecin});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailDocteur(medecin: medecin)));
      },
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                "images/vol.png",
                width: 100,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Dr. ${medecin.prenom}  ${medecin.nom}'),
                      SizedBox(
                        width: 20,
                      ),
                      StarRating(
                        starCount: 5,
                        rating: 5,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(medecin.libelleSpecialite),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(
                        width: 10,
                      ),
                      Text("08h-17h"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("region : " + medecin.region)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
