import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/models/rendez-vous.dart';
import 'package:gestion_materiel_cmu/rendez-vous/rendez-vous.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class RendezVous extends StatefulWidget {
  @override
  _RendezVousState createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  List<RendezV> rendezvous = [];
  List<RendezV> rendezv = [];
  List<RendezV> rendezE = [];

  Future<void> getR() async {
    var url = "auth/rendezvous";
    var donnees = await Connexion().recuperation(url);
    if (donnees.statusCode == 200) {
      print(url);
      print(donnees.body);
      var data = convert.jsonDecode(donnees.body);
      for (var r in data) {
        setState(() {
          rendezvous.add(RendezV(
              idR: r['id'],
              date: r['date'],
              heure: r['heure'],
              nomMedecin: r['prenom'] + " " + r['nom'],
              specialite: r['libelle'],
              structure: r['nomStructure'],
              etat: r['etat']));
        });
      }
      // rendezvous.forEach((element) {
      //   if (element.etat == "en attente") {
      //     setState(() {
      //       rendezE.add(element);
      //     });
      //   }
      // });
      // rendezvous.forEach((element) {
      //   if (element.etat == "accepter") {
      //     setState(() {
      //       rendezv.add(element);
      //     });
      //   }
      // });
      setState(() {
        rendezv =
            rendezvous.where((element) => element.etat == "accepter").toList();
        rendezE = rendezvous
            .where((element) => element.etat == "en attente")
            .toList();
      });
      print(rendezvous.length);
      print(rendezv.length);
      print(rendezE.length);
      // print(rendezvous.where((element) => element.etat == "en attente").length);
      // setState(() {
      //   rendezv = rendezvous.where((element) => element.etat == "en attente");
      // });
      // print(rendezvous.length);
      // print(rendezv.length);
    }
  }

  // void filter() {
  //   setState(() {
  //     fl = list.where((element) => element.domaine == 'Genecologie');
  //   });

  //   print(fl);
  // }

  @override
  void initState() {
    getR();
    //filter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue[900],
                centerTitle: true,
                title: Text("RENDEZ-VOUS"),
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    labelPadding: EdgeInsets.only(bottom: 10),
                    indicatorPadding: EdgeInsets.only(top: 10),
                    tabs: [
                      Text(
                        "A venir",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "envoyés",
                        style: TextStyle(fontSize: 18),
                      )
                    ])),
            body: Container(
                child: TabBarView(children: [
              Container(
                  child: rendezv.isEmpty
                      ? Center(
                          child: Text("Vous n'avez pas de rendez-vous a venir"))
                      : ListView.builder(
                          itemCount: rendezv.length,
                          itemBuilder: (context, index) {
                            return Rv(
                              rv: rendezv[index],
                            );
                          })),
              Container(
                  child: rendezE.isEmpty
                      ? Center(
                          child: Text(
                              "vous n'avez aucune demande de rendez-vous envoyés"))
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: rendezE.length,
                          itemBuilder: (context, index) {
                            return Rv(
                              rv: rendezE[index],
                            );
                          }))
            ]))));
  }
}
