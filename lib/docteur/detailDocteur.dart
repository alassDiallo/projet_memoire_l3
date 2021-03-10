import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';

class DetailDocteur extends StatelessWidget {
  Medecin medecin;
  DetailDocteur({this.medecin});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/doctor-5883502_640.png'),
            alignment: Alignment.topLeft,
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset("images/vol.png"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dr. " + medecin.prenom + " " + medecin.nom,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(height: 10),
                        Text(medecin.libelleSpecialite),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                            ),
                            Text(medecin.structure),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            Text(medecin.region),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(10)),
                              //padding: EdgeInsets.all(10),
                              child: IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.yellow[50],
                                    borderRadius: BorderRadius.circular(10)),
                                // padding: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () {},
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(10)),
                              // padding: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(
                                  Icons.videocam_off,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("A propos du Medecin",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Notre choix est porté sur le modèle vu contrôleur (MVC) qui présente beaucoup d’avantages.Ce modèle permet de classer les différentes parties de l’application. Le modèle représente la partie logique de l’application c’est à dire les interactions avec la base de données, les traitements des opérations correspondants",
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {},
                  child: Text("Demender un rendez-vous"),
                  color: Colors.blue,
                  textColor: Colors.white,
                )),
          ),
        ],
      ),
    )));
  }
}
