import 'package:gestion_materiel_cmu/models/Analyse.dart';

import 'Connexion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class AnalyselistP {
  List<AnalyseM> analyses = [];

  Future<List<AnalyseM>> getAnalyse() async {
    String url = "auth/analysesPatient";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var analyse in donnee) {
        analyses.add(AnalyseM(
          libelle: analyse["libelle"], prix: analyse["prix"].toDouble(),
          // idPatient: analyse["idPatient"],
        ));
      }
      return analyses;
    }
  }

  AnalyselistP() {
    this.getAnalyse();
    this.analyses;
  }
}
