import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_maintenance.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_patient.dart';

class MenuCardR2 extends StatelessWidget {
  // final String text;
  // final Widget icon;
  final Color couleurCard;
  // final Color couleurCircle;
  MenuCardR2({
    // this.text,
    // this.icon,
    this.couleurCard,
    // this.couleurCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: couleurCard,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width * 0.9,
              //  height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Statistique",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Image.asset(
                        "images/stat.png",
                        height: MediaQuery.of(context).size.height * 0.12,
                      )
                    ],
                  ),
                  Divider(
                    height: 10,
                    color: Colors.blue,
                    thickness: 2,
                    indent: 2,
                    endIndent: 15,
                  ),
                ],
              ),
            )));
  }
}
