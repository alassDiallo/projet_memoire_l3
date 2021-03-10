import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_maintenance.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_patient.dart';

class MenuCardR extends StatelessWidget {
  // final String text;
  // final Widget icon;
  final Color couleurCard;
  // final Color couleurCircle;
  MenuCardR({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width * 0.9,
          //  height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rapports",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.white,
                    thickness: 2,
                    indent: 2,
                    endIndent: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Rapport_Patient()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.person_sharp,
                            color: Colors.white,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Patient   ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        // Divider(
                        //   height: 20,
                        //   color: Colors.white,
                        //   thickness: 1,
                        //   indent: 13,
                        //   endIndent: 15,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Rapport_Depense()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   Dépense  ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        // Divider(
                        //   height: 20,
                        //   color: Colors.white,
                        //   thickness: 1,
                        //   indent: 13,
                        //   endIndent: 15,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Rapport_Maintenance()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.miscellaneous_services_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Maintenance",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        // Divider(
                        //   height: 20,
                        //   color: Colors.white,
                        //   thickness: 1,
                        //   indent: 13,
                        //   endIndent: 15,
                        // ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
