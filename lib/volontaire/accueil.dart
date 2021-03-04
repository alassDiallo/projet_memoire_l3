import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/couleurs.dart';
import 'package:gestion_materiel_cmu/discussion/menu_plus.dart';
import 'package:gestion_materiel_cmu/volontaire/image.dart';
import 'package:gestion_materiel_cmu/volontaire/info.dart';
import 'package:gestion_materiel_cmu/volontaire/liste.dart';
import 'package:gestion_materiel_cmu/volontaire/option.dart';

class Volontaire extends StatefulWidget {
  @override
  _VolontaireState createState() => _VolontaireState();
}

class _VolontaireState extends State<Volontaire> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Stack(
                          children: [
                            OpaqueImage(
                              imageUrl: "images/vol.png",
                            ),
                            SafeArea(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Mon profils",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        )),
                                    InfoProfil()
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
                        color: Colors.white,
                        child: Table(
                          children: [
                            TableRow(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Liste()));
                                },
                                child: Fonctionalite(
                                    nombre: "13",
                                    text: "patient",
                                    icon: Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              ),
                              GestureDetector(
                                child: Fonctionalite(
                                    nombre: "22",
                                    text: "ordenance",
                                    icon: Icon(
                                      Icons.file_present,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              )
                            ]),
                            TableRow(children: [
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "13",
                                    text: "patient",
                                    icon: Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "22",
                                    text: "ordenance",
                                    icon: Icon(
                                      Icons.file_present,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              )
                            ]),
                            TableRow(children: [
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "13",
                                    text: "patient",
                                    icon: Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "22",
                                    text: "ordenance",
                                    icon: Icon(
                                      Icons.file_present,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              )
                            ]),
                            TableRow(children: [
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "13",
                                    text: "patient",
                                    icon: Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Fonctionalite(
                                    nombre: "22",
                                    text: "ordenance",
                                    icon: Icon(
                                      Icons.file_present,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: size.height * (3 / 9) + (80 / 2),
                  child: Container(
                    // color: Colors.green,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 12,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 16, bottom: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.add)),
                                  Text("asssane diallobd",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: secondaryTextColor)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 12,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 16, bottom: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.add)),
                                  Text("asssane dia",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: secondaryTextColor)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 12,
                            // shape: RoundedRectangleBorder(
                            // borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 16, bottom: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.add)),
                                  Text("asssane dia",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: secondaryTextColor)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
