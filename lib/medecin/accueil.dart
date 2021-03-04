import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/medecin/calendrier.dart';
import 'package:gestion_materiel_cmu/medecin/listePatientJour.dart';
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
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Center(
              child: Table(children: [
            TableRow(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListePatient()));
                },
                child: Card(
                    margin: EdgeInsets.only(top: 20, right: 5),
                    //margin: EdgeInsets.only(right: 20, left: 10),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        // height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2,
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "12",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
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
                    margin: EdgeInsets.only(top: 20, left: 5),
                    //margin: EdgeInsets.only(right: 20, left: 10),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        //height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2,
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "12",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendrier()));
                },
                child: Card(
                    margin: EdgeInsets.only(top: 20, right: 5),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ()));*/
                },
                child: Card(
                    // margin: EdgeInsets.only(right: 10, left: 10),
                    margin: EdgeInsets.only(top: 20, left: 5),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),

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
        ));
  }
}
