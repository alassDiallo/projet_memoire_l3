import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/consulation.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/depense/liste.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menuCard.dart';
import 'package:gestion_materiel_cmu/volontaire/widget_composant/menuItems_Drawer.dart';

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
  static const coleur = Color(0xFF363568);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          leading: Icon(Icons.menu_open_outlined),
          title: Text("Acceuil Volontaire"),
          centerTitle: true,
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
          ...this.menus.map((item) {
            return Column(
              children: <Widget>[
                MenuItemsDrawer(item['title'], item['icon'], (context) {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => item['page']));
                }),
                Divider(
                  color: Colors.grey,
                ),
              ],
            );
          }),
        ])),
        body: SingleChildScrollView(
          child: Container(
            // color: coleur,
            color: Colors.white70,
            width: double.infinity,
            // height: size.height,
            child: Column(
              children: [
                Card(
                  color: Colors.blueAccent.withOpacity(0.5),
                  // color: coleur.withOpacity(0.4),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  margin: EdgeInsets.fromLTRB(0, 1, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CircleAvatar(child: Text("SBD"), radius: 45)),
                      SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "S Bassirou Dabo",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Structure de Diourbel",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Ordonnance()));
                //   },
                //   child: MenuCard(
                //     text: "Ordonnance",
                //     icon: Icon(
                //       Icons.person,
                //       color: Colors.white,
                //       size: 40,
                //     ),
                //     couleurCard: Colors.blueAccent.withOpacity(0.5),
                //     couleurCircle: Colors.greenAccent,
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.only(top: 20),
                  // color: Colors.white,
                  child: Table(children: [
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                       Consultation()
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPatient1(
                                   
                                        page: Consultation(),
                                        couleur:
                                            Colors.greenAccent.withOpacity(0.5),
                                      )));
                        },
                        child: MenuCard(
                          text: "Consultation",
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                          couleurCard: Colors.blueAccent.withOpacity(0.5),
                          couleurCircle: Colors.greenAccent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Analys
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPatient1(
                                        page: AnalyseP(),
                                        couleur:
                                            Colors.redAccent.withOpacity(0.6),
                                      )));
                        },
                        child: Container(
                          child: MenuCard(
                              text: "  Analyse ",
                              icon: Icon(
                                Icons.article_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                              couleurCard: Colors.blueAccent.withOpacity(0.5),
                              couleurCircle: Colors.redAccent.shade200),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Rapport()));
                        },
                        child: MenuCard(
                            text: "  Rapport   ",
                            icon: Icon(
                              Icons.assessment_sharp,
                              color: Colors.white,
                              size: 40,
                            ),
                            couleurCard: Colors.blueAccent.withOpacity(0.5),
                            couleurCircle: Colors.blueAccent),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Liste()));
                        },
                        child: MenuCard(
                            text: "  Depense   ",
                            icon: Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                              size: 40,
                            ),
                            couleurCard: Colors.blueAccent.withOpacity(0.5),
                            couleurCircle: Colors.yellow),
                      )
                    ]),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
