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
          title: Text("Liste des medecins"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
            child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 4,
          children: List.generate(medecins.length, (index) {
            return Docteur(
              medecin: medecins[index],
            );
          }),
        )));
  }
}
