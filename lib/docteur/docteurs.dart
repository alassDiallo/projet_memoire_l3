import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/controllers/ControllerMedecin.dart';
import 'package:gestion_materiel_cmu/docteur/infoDocteur.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class Medecins extends StatefulWidget {
  @override
  _MedecinsState createState() => _MedecinsState();
}

class _MedecinsState extends State<Medecins> {
  List<Medecin> medecins = [];
  List<Medecin> filtre = [];

  Future<void> _getMedecins() async {
    String url = "auth/medecin";
    var donnee = await Connexion().recuperation(url);
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
              telephone: med['telephone'],
              idMedecin: med["idMedecin"],
              structure: med["nomStructure"]));
        });
      }
      setState(() {
        filtre = medecins;
      });
    }
  }

  @override
  void initState() {
    _getMedecins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         icon: Icon(
        //           Icons.search,
        //         ),
        //         onPressed: () {})
        //   ],
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            topRight: Radius.circular(30))),
                    child: Container(
                      decoration: BoxDecoration(),
                      margin: EdgeInsets.only(left: 10, right: 50),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: BackButton(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Medecins",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Divider(
                            thickness: 5,
                            indent: 100,
                            endIndent: 100,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                onChanged: (value) {
                                  filtrer(value);
                                },
                                decoration: InputDecoration(
                                    hintText: "recherche...",
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.search)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: filtre.isEmpty
                            ? Container(
                                height: 50, child: CircularProgressIndicator())
                            : GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 4,
                                children: List.generate(filtre.length, (index) {
                                  return Docteur(
                                    medecin: filtre[index],
                                  );
                                }),
                              )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void filtrer(String f) {
    setState(() {
      filtre = medecins
          .where((element) =>
              element.nom.toLowerCase().contains(f.toLowerCase()) ||
              element.prenom.toLowerCase().contains(f.toLowerCase()) ||
              element.telephone.contains(f) ||
              element.libelleSpecialite
                  .toLowerCase()
                  .contains(f.toLowerCase()) ||
              element.structure.toLowerCase().contains(f.toLowerCase()) ||
              element.region.toLowerCase().contains(f.toLowerCase()))
          .toList();
    });
  }
}
