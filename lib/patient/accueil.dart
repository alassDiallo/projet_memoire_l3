import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/consultation/consultation.dart';
import 'package:gestion_materiel_cmu/discussion/messagerie.dart';
import 'package:gestion_materiel_cmu/map/map.dart';
import 'package:gestion_materiel_cmu/patient/ItemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/historique.dart';
import 'package:gestion_materiel_cmu/patient/option.dart';
import 'package:gestion_materiel_cmu/patient/slide.dart';
import 'listeConsultation.dart';
import 'rendez_vous.dart';
import 'package:gestion_materiel_cmu/medecin/discussion.dart';
//import 'package:badges/badges.dart';

class AccueilPatient extends StatefulWidget {
  @override
  _AccueilPatientState createState() => _AccueilPatientState();
}

class _AccueilPatientState extends State<AccueilPatient> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                offset: Offset(100, 40),
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => _popup())
          ],
        ),
        drawer: _drawer(),
        bottomNavigationBar: _bottomNavigationBar(),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 50),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      "images/ac.jpg",
                    ),
                    // height: MediaQuery.of(context).size.height / 2,
                  ),
                  Text("$_currentIndex"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListeC()));
                              },
                              child: Option(
                                  couleur: Colors.green,
                                  icon: Icon(
                                    Icons.local_hospital,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  text: "Consultation"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RendezVous()));
                              },
                              child: Option(
                                  couleur: Colors.red,
                                  icon: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  text: "Mes Rendez-vous"),
                            ),
                          ],
                        ),
                        TableRow(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Localisation()));
                            },
                            child: Option(
                                couleur: Colors.blue,
                                icon: Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                text: "Map"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Historique()));
                            },
                            child: Option(
                                couleur: Colors.yellow[700],
                                icon: Icon(
                                  Icons.history,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                text: "historique"),
                          ),
                        ]),
                      ],
                    ),
                  )
                ]))));
  }

  void premierInterface() {
    Stack(children: [
      Container(
          child: Column(children: [
        Container(
          color: Colors.blue[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Al hassane diallo",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Divider(
                thickness: 3,
                height: 30,
                indent: 30,
                endIndent: 30,
                color: Colors.white,
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 6,
        ),
        Container(
            // color: Colors.blue[100],
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListeC()));
                    },
                    child: Card(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        color: Colors.green,
                        elevation: 10,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital,
                                size: 60,
                                color: Colors.white,
                              ),
                              Text(
                                "Consultation",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                        )),
                  ),
                  /*GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListeC()));
                                },
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height / 6,
                                      //padding: EdgeInsets.symmetric(horizontal: 5),
                                      width:
                                          MediaQuery.of(context).size.width * 0.45,
                                      child: Center(
                                          child:
                                              Text("Demander un \nrendez_vous"))),
                                ),
                              )*/
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RendezVous()));
                    },
                    child: Card(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        elevation: 10,
                        child: Container(
                            color: Colors.pink[500],
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.perm_contact_calendar,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Mes Rendez-vous",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            )))),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        elevation: 10,
                        child: Container(
                            color: Colors.orange,
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.map,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                Text(
                                  "MAP",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            )))),
                  )
                ],
              )),
        )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ExpansionTile(
            leading: Icon(Icons.history),
            trailing: Icon(Icons.add),
            title: Text(
              "Historique",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            children: [
              ListTile(
                title: Text(
                  "RADIOLOGIE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Ophtalmologie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Ophtalmologie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Ophtalmologie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Ophtalmologie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Neurologie",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Dr Moussa Kane"),
                trailing: Text("21/12/2020"),
              ),
              Divider(),
            ],
          ),
        )
      ]))
    ]);
  }

  void redirect(int index) {
    switch (index) {
      case 1:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Messagerie()));
        }
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        redirect(_currentIndex);
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Messagerie()));*/
      },
      backgroundColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          label: "Accueil",
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(label: 'Messages', icon: Icon(Icons.chat)
            /*icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: BorderRadius.circular(100),
            child: Icon(Icons.message, color: Colors.white),
            badgeContent: Container(
              child: Text("10",
                  style: TextStyle(color: Colors.white, fontSize: 8)),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),*/
            ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
          /*icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: BorderRadius.circular(100),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            badgeContent: Container(
              child: Text("50",
                  style: TextStyle(color: Colors.white, fontSize: 8)),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),*/
        ),

        /// BottomNavigationBarItem(label: 'plus', icon: Icon(Icons.more_horiz)),
      ],
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text("AHD"),
                    radius: 30,
                    foregroundColor: Colors.red,
                  ),
                  Text(
                    "Al Hassane Diallo",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )),
            ),
            ListTile(leading: Icon(Icons.person), title: Text("Profil")),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Modifier votre mot de passe"),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.share),
                title: Text("Partager l'application")),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("se deconnecter"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Aide"),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  List<Widget> _popup() {
    var list = List<PopupMenuEntry<Object>>();

    list.add(PopupMenuItem(child: Text("Nouvel nbsnabjhasijhasisajiasjuiju")));
    list.add(PopupMenuDivider());
    list.add(PopupMenuItem(child: Text("Nouvel nbsnabjhasijhasisajiasjuiju")));
    list.add(PopupMenuDivider());
    list.add(PopupMenuItem(child: Text("Nouvel nbsnabjhasijhasisajiasjuiju")));
    list.add(PopupMenuDivider());
    list.add(PopupMenuItem(child: Text("Nouvel nbsnabjhasijhasisajiasjuiju")));
    list.add(PopupMenuDivider());

    return list;
  }
}
