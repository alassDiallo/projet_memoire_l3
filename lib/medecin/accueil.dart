import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/discussion/messagerie.dart';
import 'package:gestion_materiel_cmu/medecin/Affichage.dart';
import 'package:gestion_materiel_cmu/medecin/calendrier.dart';
import 'package:gestion_materiel_cmu/medecin/listePatientJour.dart';
import 'package:gestion_materiel_cmu/medecin/parametre.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'discussion.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

class AccueilMedecin extends StatefulWidget {
  @override
  _AccueilMedecinState createState() => _AccueilMedecinState();
}

class _AccueilMedecinState extends State<AccueilMedecin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Messagerie()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ]),
        body: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(left: 10, right: 10),
            //color: Colors.blue[100],
            // height: double.infinity,
            //height: MediaQuery.of(context).size.height,

            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/p.jpg",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Table(children: [
                        TableRow(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListePatient()));
                            },
                            child: Card(
                                color: Colors.pink[100],
                                //color: Colors.transparent,
                                //margin: EdgeInsets.only(top: 20, right: 5),
                                //margin: EdgeInsets.only(right: 20, left: 10),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    // height: MediaQuery.of(context).size.height / 5,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    //width: MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.pink,
                                          radius: 50,
                                          child: Icon(
                                            Icons.list,
                                            size: 60,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Liste patient",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )))),
                          ),
                          GestureDetector(
                            onTap: () {
                              /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ()));*/
                            },
                            child: Card(
                                color: Colors.blue[100],
                                margin: EdgeInsets.only(left: 5, bottom: 20),
                                //margin: EdgeInsets.only(right: 20, left: 10),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    //height: MediaQuery.of(context).size.height / 5,
                                    //width: MediaQuery.of(context).size.width / 2,
                                    //width: MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.blue,
                                          child: Icon(
                                            Icons.event_note,
                                            size: 60,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Rendez-vous",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )))),
                          ),
                        ]),
                        TableRow(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Calendrier()));
                            },
                            child: Card(
                                color: Colors.greenAccent[100],
                                margin: EdgeInsets.only(right: 5),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    // height: MediaQuery.of(context).size.height / 5,
                                    //width: MediaQuery.of(context).size.width / 2,
                                    //width: MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.greenAccent,
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            size: 60,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Calendrier",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )))),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Parametre()));
                            },
                            child: Card(
                                color: Colors.yellow[100],
                                // margin: EdgeInsets.only(right: 10, left: 10),
                                margin: EdgeInsets.only(left: 5),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),

                                    //height: MediaQuery.of(context).size.height / 5,
                                    //width: MediaQuery.of(context).size.width / 2,
                                    //width: MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.amberAccent,
                                          radius: 50,
                                          child: Icon(
                                            Icons.miscellaneous_services,
                                            size: 60,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Parametre",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )))),
                          ),
                        ])
                      ]),
                    ),
                  ],
                )),
          ),
        ));
  }

  void _logout() async {
    var res = await Connexion().deconnexion('auth/logout');
    var body = convert.jsonDecode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
