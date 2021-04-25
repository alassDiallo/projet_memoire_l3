import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/Statistique.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/facturation/analyse.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/facturation/analyse_ordonnance.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/consulation.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_maintenance.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_patient.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menuCard.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menuItems_Drawer.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menucardR.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menucardR2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class Volontaire extends StatefulWidget {
  @override
  _VolontaireState createState() => _VolontaireState();
}

class _VolontaireState extends State<Volontaire> {
  final menus = [
    {
      'title': 'Profil',
      'icon': Icons.person,
      'page': '',
    },
    {
      'title': 'Modifier mot de passe ',
      'icon': Icons.lock,
      'page': '',
    },
    {
      'title': 'Se deconnecter ',
      'icon': Icons.logout,
      'page': '',
    },
    {
      'title': "Partager l'application ",
      'icon': Icons.share,
      'page': '',
    },
    {
      'title': 'Aide ',
      'icon': Icons.help,
      'page': '',
    },
  ];
  //  int selectedIndex = 0;
  // static List<Widget> _widgetOptions = <Widget>[
  //   Volontaire(),
  //   Text("ok"),
  //   //Rapport_Maintenance(),
  //   Text("ok"),
  // ];
  // void onTapHandler(int index) {
  //   this.setState(() {
  //     this.selectedIndex = index;
  //   });
  // }
  static const coleur = Color(0xFF1F0799);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: coleur,
        appBar: AppBar(
          //backgroundColor: coleur,
          //automaticallyImplyLeading: false,

          title: Text(""),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.message_rounded), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
            child: ListView(children: [
          DrawerHeader(
            child: Center(
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text("SBD"),
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 40,
                  ),
                  Text("S Bassirou Dabo"),
                ],
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white, Colors.blueAccent]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('profil'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Modifer mot de passe'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("partager l'application"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('se deconnecter'),
            onTap: _logout,
          ),
          Divider(),
        ])),
        body: SingleChildScrollView(
          child: Container(
            // color: coleur,
            //color: Colors.white70,
            width: double.infinity,
            // height: size.height,
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatistiqueV()));
                          },
                          child: MenuCardR2()),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Patient()));
                        },
                        child: Container(
                          child: MenuCard(
                              text: "  Patients ",
                              icon: Image.asset("images/searche.png"),
                              couleurCard: Colors.white,
                              couleurCircle: Colors.red),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPatient1(
                                        page: Consultation(),
                                        nom: "Espace  \ Consultation",
                                        couleur: Colors.green.withOpacity(0.5),
                                      )));
                        },
                        child: MenuCard(
                          text: "Consultation\n",
                          icon: Image.asset("images/ac.jpg"),
                          couleurCard: Colors.white,
                          couleurCircle: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPatient1(
                                        page: Analyse_Ordonnance(),
                                        nom: "Espace  \ Facturation",
                                        couleur: Colors.red.withOpacity(0.5),
                                      )));
                        },
                        child: Container(
                          child: MenuCard(
                              text: "Ordonnance \net Analyse ",
                              icon: Image.asset("images/rapport2.png"),
                              couleurCard: Colors.white,
                              couleurCircle: Colors.blue),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Rapport_Depense()));
                        },
                        child: Container(
                          child: MenuCard(
                              text: "  Dépense ",
                              icon: Image.asset("images/comptabilite.png"),
                              couleurCard: Colors.white,
                              couleurCircle: Colors.red),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Rapport_Maintenance()));
                        },
                        child: Container(
                          child: MenuCard(
                              text: "  Maintenance ",
                              icon: Icon(
                                Icons.miscellaneous_services_outlined,
                                color: Colors.blue[900],
                                size: 60,
                              ),
                              couleurCard: Colors.white,
                              couleurCircle: Colors.red),
                        ),
                      )
                    ])
                  ],
                ),
                // Card(
                //   color: Colors.blueAccent.withOpacity(0.5),
                //   // color: coleur.withOpacity(0.4),
                //   elevation: 10,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(40),
                //           bottomRight: Radius.circular(40))),
                //   margin: EdgeInsets.fromLTRB(0, 1, 0, 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           child: CircleAvatar(child: Text("SBD"), radius: 45)),
                //       SizedBox(height: 15),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text(
                //             "S Bassirou Dabo",
                //             style: TextStyle(color: Colors.black, fontSize: 20),
                //           ),
                //           SizedBox(height: 10),
                //           Text(
                //             "Structure de Diourbel",
                //             style: TextStyle(color: Colors.black, fontSize: 15),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // MenuCardR2(
                //   couleurCard: Colors.white.withOpacity(0.3),
                // ),
                // Container(
                //   padding: EdgeInsets.only(top: 20),
                //   // color: Colors.white,
                //   child: Table(children: [
                //     TableRow(children: [
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => FormPatient1(
                //                         page: Consultation(),
                //                         couleur: Colors.green.withOpacity(0.5),
                //                       )));
                //         },
                //         child: MenuCard(
                //           text: "Consultation",
                //           icon: Icon(
                //             Icons.local_hospital,
                //             color: Colors.white,
                //             size: 40,
                //           ),
                //           couleurCard: Colors.white,
                //           couleurCircle: Colors.green,
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => FormPatient1(
                //                         page: Analyse(),
                //                         couleur: Colors.red.withOpacity(0.5),
                //                       )));
                //         },
                //         child: Container(
                //           child: MenuCard(
                //               text: "  Analyse ",
                //               icon: Icon(
                //                 Icons.article_rounded,
                //                 color: Colors.white,
                //                 size: 50,
                //               ),
                //               couleurCard: Colors.white,
                //               couleurCircle: Colors.red),
                //         ),
                //       )
                //     ]),
                //   ]),
                // ),
                // MenuCardR(
                //   couleurCard: Colors.white,
                // ),
              ],
            ),
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
