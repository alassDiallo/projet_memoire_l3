import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/rendez-vous/rendez-vous.dart';

class RendezVous extends StatefulWidget {
  @override
  _RendezVousState createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  List<Rend> fl;
  List<Rend> list = [
    Rend(
        nomDocteur: "Moussa Sarr",
        domaine: "Ophtalmologie",
        date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Radiologie", date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Neurologie", date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Genecologie", date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Radiologie", date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Neurologie", date: "21/12/2021"),
    Rend(nomDocteur: "Moussa Sarr", domaine: "Genecologie", date: "21/12/2021"),
  ];
  void filter() {
    setState(() {
      fl = list.where((element) => element.domaine == 'Genecologie');
    });

    print(fl);
  }

  @override
  void initState() {
    filter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text("RENDEZ-VOUS"),
                bottom: TabBar(
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
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Rv();
                      })),
              Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Rv();
                      }))
            ]))));
  }
}

class Rend {
  String nomDocteur;
  String domaine, date;
  Rend({this.nomDocteur, this.date, this.domaine});
}
