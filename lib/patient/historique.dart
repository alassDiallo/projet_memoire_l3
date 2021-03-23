import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/rendez-vous.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class Historique extends StatefulWidget {
  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  List<RendezV> rendezvous = [];
  DateFormat df = DateFormat("dd/MM/yyyy");
  Future<void> getR() async {
    var url = "auth/historique";
    print(url);
    var donnees = await Connexion().recuperation(url);
    if (donnees.statusCode == 200) {
      print(donnees.body);
      var data = convert.jsonDecode(donnees.body);
      for (var r in data) {
        setState(() {
          rendezvous.add(RendezV(
              date: r['date'],
              heure: r['heure'],
              nomMedecin: r['prenom'] + " " + r['nom'],
              specialite: r['libelle'],
              structure: r['nomStructure'],
              etat: r['etat']));
        });
      }
    }
  }

  @override
  void initState() {
    getR();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "Mon Historique ",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: rendezvous.isEmpty
              ? Center(
                  child: Text("votre historique est vide"),
                )
              : ListView.builder(
                  itemCount: rendezvous.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                    SizedBox(height: 10),
                                    Text(df.format(
                                        DateTime.parse(rendezvous[index].date)))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Heure",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                    SizedBox(height: 10),
                                    Text(rendezvous[index].heure)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Medecin",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                    SizedBox(height: 10),
                                    Text("Dr. ${rendezvous[index].nomMedecin}")
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Specialité",
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.5))),
                                      SizedBox(height: 10),
                                      Text("${rendezvous[index].specialite}")
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Structure",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    SizedBox(height: 10),
                                    Text("${rendezvous[index].structure}")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }
}
