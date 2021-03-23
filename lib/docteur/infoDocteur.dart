import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gestion_materiel_cmu/docteur/detailDocteur.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';

class Docteur extends StatelessWidget {
  Medecin medecin;
  Docteur({this.medecin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailDocteur(
                      medecin: medecin,
                    )));
      },
      child: Container(
        // padding: EdgeInsets.all(20),

        //margin: EdgeInsets.only(left: 5),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr. " + medecin.prenom + " " + medecin.nom,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          medecin.libelleSpecialite,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(medecin.structure ?? 'neant',
                            style: TextStyle(fontSize: 10)),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            Text(medecin.region ?? 'neant',
                                style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        StarRating(
                          size: 15,
                          color: Colors.orange,
                          borderColor: Colors.orange,
                          rating: 5,
                          starCount: 5,
                          onRatingChanged: (rate) {},
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 12),
                        ),
                        Text(
                          "2 ans",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Image.asset(
                      "images/vol.png",
                      width: MediaQuery.of(context).size.width * 0.180,
                      //height: 140,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
