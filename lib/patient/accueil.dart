import 'dart:convert';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/composants/drawer.dart';
import 'package:gestion_materiel_cmu/consultation/consultation.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/discussion/messagerie.dart';
import 'package:gestion_materiel_cmu/map/map.dart';
import 'package:gestion_materiel_cmu/notification/notification.dart';
import 'package:gestion_materiel_cmu/patient/ItemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/historique.dart';
import 'package:gestion_materiel_cmu/patient/option.dart';
import 'package:gestion_materiel_cmu/patient/slide.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menuCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'listeConsultation.dart';
import 'rendez_vous.dart';
import 'package:gestion_materiel_cmu/medecin/discussion.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert' as convert;
//import 'package:badges/badges.dart';

class AccueilPatient extends StatefulWidget {
  @override
  _AccueilPatientState createState() => _AccueilPatientState();
}

class _AccueilPatientState extends State<AccueilPatient> {
  IO.Socket socket;
  int _currentIndex = 0;
  var patient;
  @override
  void initState() {
    token();
    socket = IO.io("http://192.168.43.100:3000/", <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((data) => print("bonjour je suis connecter"));
    socket.on("message", (data) => print("vous avez un nouveau message"));
    print(socket.connected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.chat),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Messagerie()));
        //   },
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                //offset: Offset(100, 40),
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => _popup())
          ],
        ),
        drawer: Drawers(),
        bottomNavigationBar: BubbleBottomBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            redirect(_currentIndex);
          },
          opacity: 0.2,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          currentIndex: _currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          items: [
            BubbleBottomBarItem(
                backgroundColor: Colors.blue[900],
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue[900],
                ),
                title: Text("Accueil"),
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                )),
            BubbleBottomBarItem(
                title: Text("message"),
                activeIcon: Icon(
                  Icons.chat,
                  color: Colors.blue[900],
                ),
                backgroundColor: Colors.blue[900],
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                )),
            BubbleBottomBarItem(
                title: Text("notification"),
                activeIcon: Icon(
                  Icons.notifications,
                  color: Colors.blue[900],
                ),
                backgroundColor: Colors.blue[900],
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 0),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      "images/accueilP.jpg",
                    ),
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                              child: MenuCard(
                                text: "Consultation",
                                icon: Image.asset("images/ac.jpg"),
                                couleurCard: Colors.green,
                                couleurCircle: Colors.green,
                                ctexte: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RendezVous()));
                              },
                              child: MenuCard(
                                text: "Rendez-vous",
                                icon: Image.asset("images/rapport2.png"),
                                couleurCard: Colors.deepPurpleAccent,
                                couleurCircle: Colors.green,
                                ctexte: Colors.white,
                              ),
                            )
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
                            child: MenuCard(
                              text: "MAP",
                              icon: Image.asset("images/map.png"),
                              couleurCard: Colors.red[900],
                              couleurCircle: Colors.green,
                              ctexte: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Historique()));
                            },
                            child: MenuCard(
                              text: "Historique",
                              icon: Image.asset("images/images.png"),
                              couleurCard: Colors.orange,
                              couleurCircle: Colors.green,
                              ctexte: Colors.white,
                            ),
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
        break;
      case 2:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationM()));
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
          title: Text("Accueil"),
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(title: Text('Messages'), icon: Icon(Icons.chat)
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
          title: Text('Notification'),
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
                _logout();
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

  token() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    var t = localstorage.getString('token');
    if (t != null) {
      setState(() {
        patient = json.decode(localstorage.getString('user'));
      });
      print("-----------user-------------");
      print(patient['email']);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
