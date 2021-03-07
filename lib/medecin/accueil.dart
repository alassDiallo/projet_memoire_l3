import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/medecin/calendrier.dart';
import 'package:gestion_materiel_cmu/medecin/listePatientJour.dart';
import 'package:gestion_materiel_cmu/medecin/parametre.dart';
import 'discussion.dart';

class AccueilMedecin extends StatefulWidget {
  @override
  _AccueilMedecinState createState() => _AccueilMedecinState();
}

class _AccueilMedecinState extends State<AccueilMedecin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Discussion()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ]),
        body: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(left: 10, right: 10),
            //color: Colors.blue[900],
            // height: double.infinity,
            //height: MediaQuery.of(context).size.height,

            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                  vertical: 70, horizontal: 20),
                              // height: MediaQuery.of(context).size.height / 5,
                              // width: MediaQuery.of(context).size.width / 2,
                              //width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          margin: EdgeInsets.only(top: 40, left: 5, bottom: 20),
                          //margin: EdgeInsets.only(right: 20, left: 10),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 70, horizontal: 20),
                              //height: MediaQuery.of(context).size.height / 5,
                              //width: MediaQuery.of(context).size.width / 2,
                              //width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  vertical: 70, horizontal: 20),
                              // height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2,
                              //width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          margin: EdgeInsets.only(top: 40, left: 5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 70, horizontal: 20),

                              //height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2,
                              //width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                ])),
          ),
        ));
  }
}
