import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/composants/drawer.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutFournisseur.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutMAteriel.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutStructure.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutVolontaire.dart';
import 'package:gestion_materiel_cmu/jika/MaterielJica.dart';
import 'package:gestion_materiel_cmu/jika/fournisseurJica.dart';
import 'package:gestion_materiel_cmu/jika/statistique.dart';
import 'package:gestion_materiel_cmu/jika/structureJica.dart';
import 'package:gestion_materiel_cmu/jika/volontaireJica.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'comptabilite.dart';

class AccueilJica extends StatefulWidget {
  @override
  _AccueilJicaState createState() => _AccueilJicaState();
}

class _AccueilJicaState extends State<AccueilJica> {
  var admin;

  @override
  void initState() {
    token();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
            color: Colors.white,
          ),
          PopupMenuButton(
              initialValue: 0,
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('profil'),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Se deconnecter"),
                      onTap: _logout,
                    ),
                  )
                ];
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Comptabilite()));
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Comptabilité",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "15000000 ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                      child: Image.asset(
                                    "images/comptabilite.png",
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                  ))
                                ],
                              ),
                              Divider(
                                height: 5,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Statistique()));
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Statistique",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "images/stat.png",
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(30),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rapport",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.file_copy_outlined,
                                  size: 50,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Table(
                    children: [
                      TableRow(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VolontaireJica()));
                          },
                          child: option(
                              "13",
                              Icon(
                                Icons.person_add_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              "Volontaire"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StructureJica()));
                          },
                          child: option(
                              "22",
                              Icon(
                                Icons.home_work,
                                color: Colors.white,
                                size: 40,
                              ),
                              "Structure"),
                        )
                      ]),
                      TableRow(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaterielJica()));
                          },
                          child: option(
                            "13",
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 40,
                            ),
                            "Materiel",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FournisseurJica()));
                          },
                          child: option(
                            "22",
                            Icon(
                              Icons.transfer_within_a_station,
                              color: Colors.white,
                              size: 40,
                            ),
                            "Fournisseur",
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget option(String nombre, Icon icon, String text) {
    return Card(
      //color: Colors.white,
      shadowColor: Colors.white,
      //elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 35),
        //padding: EdgeInsets.only(left: 20, top: 16, bottom: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Align(alignment: Alignment.topRight, child: icon),
            CircleAvatar(
              child: icon,
              radius: 40,
            ),
            SizedBox(
              height: 30,
            ),
            /*Text(nombre,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor))*/
            Text(text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))
          ],
        ),
      ),
    );
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
        admin = jsonDecode(localstorage.getString('user'));
      });
      print(admin);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
