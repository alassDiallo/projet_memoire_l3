import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class ControllerMededcin {
  List<Medecin> medecins = [];

  Future<void> getMedecin() async {
    //List<Medecin> medecins = [];
    String url = Connexion.url + "medecin";
    var donnee = await http.get(url);
    print(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var m = convert.jsonDecode(donnee.body);
      for (var med in m) {
        medecins.add(Medecin(
            nom: med["nom"],
            prenom: med["prenom"],
            libelleSpecialite: med["libelle"]));
      }
    }
  }

  ControllerMededcin() {
    this.getMedecin();
  }
}
