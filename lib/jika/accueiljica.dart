import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutFournisseur.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutMAteriel.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutStructure.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutVolontaire.dart';
import 'package:gestion_materiel_cmu/jika/statistique.dart';
import 'comptabilite.dart';

class AccueilJica extends StatelessWidget {
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
              icon: Icon(Icons.more_horiz),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("bonjour"),
                  ),
                  PopupMenuItem(
                    child: Text("bonjour"),
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
<<<<<<< HEAD
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
=======
                    Card(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
>>>>>>> sbd
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      color: Colors.yellow[600],
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
                                  Icons.account_balance,
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
                                    builder: (context) =>
                                        AjoutVolontaireFormulaire()));
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
                                    builder: (context) => AjoutStructure()));
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
                                    builder: (context) => AjoutMateriel()));
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
                                    builder: (context) => AjoutFournisseur()));
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
}
