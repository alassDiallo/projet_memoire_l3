import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gestion_materiel_cmu/consultation/analyse.dart';
import 'package:gestion_materiel_cmu/consultation/consultations.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/docteur/detailDocteur.dart';
import 'package:gestion_materiel_cmu/docteur/docteurs.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/patient/detailConsultation.dart';
import 'package:gestion_materiel_cmu/patient/itemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/slide.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class ListeC extends StatefulWidget {
  @override
  _ListeCState createState() => _ListeCState();
}

class _ListeCState extends State<ListeC> {
  Widget con(int index) {
    Consultation c = list[index];
  }

  List<Medecin> medecins = [];

  Future<void> _getMedecins() async {
    String url = Connexion.url + "medecin";
    var donnee = await http.get(url);
    print(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var m = convert.jsonDecode(donnee.body);
      for (var med in m) {
        setState(() {
          medecins.add(Medecin(
              nom: med["nom"],
              prenom: med["prenom"],
              libelleSpecialite: med["libelle"],
              region: med["region"],
              structure: med["nomStructure"]));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getMedecins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        title: Text(
          "Liste Consultation",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Slide()),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20),
                  //         topRight: Radius.circular(20)
                  //         )
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Consultations",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Consultations()));
                          },
                          child: Text("voir+", style: TextStyle(fontSize: 16)))
                      // GestureDetector(
                      //     onTap: () {

                      //     },
                      //     child: Text("voir+", style: TextStyle(fontSize: 16))),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.23,
                //width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ItemConsultation(
                          consultation: list[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(consultation: list[index]))));
                    }),
              ),
              // Container(
              //     alignment: Alignment.center,
              //     margin: EdgeInsets.only(top: 20),
              //     padding: EdgeInsets.all(10),
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(20),
              //             topRight: Radius.circular(20))),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Analyse et Examen",
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.bold),
              //         ),
              //         Text("voir+", style: TextStyle(fontSize: 16)),
              //       ],
              //     )),
              // Container(
              //   height: 270,
              //   child: ListView.builder(
              //       itemCount: 10,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Analyse();
              //       }),
              // ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Medecin",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Medecins()));
                          },
                          child: Text("voir+", style: TextStyle(fontSize: 16))),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                    itemCount: medecins.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _medecin(medecins[index]);
                    }),
              ),
              // Container(
              //     alignment: Alignment.center,
              //     margin: EdgeInsets.only(top: 20),
              //     padding: EdgeInsets.all(10),
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(20),
              //             topRight: Radius.circular(20))),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Specialite",
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.bold),
              //         ),
              //         Text("voir+", style: TextStyle(fontSize: 16)),
              //       ],
              //     )),
              // Container(
              //   height: 270,
              //   child: ListView.builder(
              //       itemCount: 10,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Analyse();
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _medecin(Medecin m) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailDocteur(medecin: m)));
      },
      child: Container(
        padding: EdgeInsets.all(20),

        //margin: EdgeInsets.only(left: 5),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Dr. " + m.prenom.toUpperCase() + " " + m.nom.toUpperCase(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m.libelleSpecialite,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                            ),
                            Text(
                              m.structure ?? 'neant',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            Text(
                              "region de " + m.region ?? 'neant',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        StarRating(
                          size: 20,
                          color: Colors.orange,
                          borderColor: Colors.orange,
                          rating: 5,
                          starCount: 5,
                          onRatingChanged: (rate) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 16),
                            ),
                            Text(
                              "2 ans",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/vol.png",
                      width: 100,
                      //height: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
