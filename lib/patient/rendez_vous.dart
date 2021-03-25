import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/models/rendez-vous.dart';
import 'package:gestion_materiel_cmu/rendez-vous/rendez-vous.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

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
    print(url);
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
        rendezv = rendezvous
            .where((element) =>
                element.etat == "accepter" &&
                DateTime.parse(element.date).isAfter(DateTime.now()))
            .toList();
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
                            return r(
                              rendezv[index],
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

  Widget r(RendezV rv) {
    DateFormat df = DateFormat("dd/MM/yyyy");
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text(df.format(DateTime.parse(rv.date)))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Heure",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text(rv.heure.toString())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medecin",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text("Dr. " + rv.nomMedecin)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Specialité",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      SizedBox(height: 10),
                      Text(rv.specialite)
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Structure",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(height: 10),
                    Text(rv.structure)
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  //margin: EdgeInsets.only(left: 10),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.red,
                      onPressed: () {
                        annuler(rv);
                      },
                      child: Text(
                        "Annuler",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  annuler(RendezV v) {
    print(v.idR);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("annuler le rendez-vous"),
              content: Text("voulez-vous annuler ce rendez-vous ?"),
              actions: [
                FlatButton(
                    onPressed: () {
                      supprimer(v);
                    },
                    child: Text('oui')),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('non'))
              ],
            ));
  }

  Future supprimer(v) async {
    var url = "auth/rendezvous/${v.idR}";
    var donnees = await Connexion().supprimer(url);
    print(donnees);
    setState(() {
      rendezv.remove(v);
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Vous avez annuler le rendez-vous"),
      backgroundColor: Colors.green,
    ));
  }
}
