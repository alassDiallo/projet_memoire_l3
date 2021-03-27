import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
// import 'package:gestion_materiel_cmu/medecin/listepatient.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

class Calendrier extends StatefulWidget {
  @override
  _CalendrierState createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
  List<Patient> patient = [];
  List<Tab> list = [];
  List<Widget> page = [];
  List<String> dates = [];
  Map<String, List<Patient>> liste;
  List<String> l = [];
  Future<void> listeP() async {
    var url = "auth/listePatientCalendrier";
    print(url);
    var donnees = await Connexion().recuperation(url);
    print(donnees.body);
    Map<String, dynamic> jour = json.decode(donnees.body);
    print(jour.length);
    jour.forEach((key, value) {
      setState(() {
        dates.add(key);
        // p.add(Patient(
        //     heure: value['heure'],
        //     nom: value['nom'],
        //     idPatient: value['idPatient'],
        //     prenom: value['prenom'],
        //     telephone: value['telephone']));
      });
      print('------------------value----------------------');
      for (var p in value) {
        creerLigne(Patient(
            nom: p['nom'],
            prenom: p['prenom'],
            telephone: p['telephone'],
            heure: p['heure']));
      }
    });
    print(dates);
    print('---------------------------------------------------');
  }

  List d = [
    "21/12/2020",
    "23/12/2020",
    "25/12/2020",
    "28/12/2020",
  ];

  List<Widget> enfant() {
    List<Widget> l = [];
    d.forEach((element) {
      l.add(Container(
        child: null,
      ));
    });

    return l;
  }

  void i() {
    dates.forEach((element) {
      setState(() {
        list.add(Tab(
          child: Text(element),
        ));
      });
    });
  }

  @override
  void initState() {
    listeP();
    i();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(page.length);
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Mon Calendrier"),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: list,
          ),
        ),
        body: Container(
          child: TabBarView(children: [
            Container(
              child: Text("bonjour"),
            ),
            Container(
              child: Text("bonjour"),
            ),
            Container(
              child: Text("bonjour"),
            ),
          ]
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              // ],
              ),
        ),
      ),
    );
  }

  void creerLigne(Patient patient) {
    print(patient.nom);
    setState(() {
      page.add(Container(
          child: DataTable(
        headingTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        columnSpacing: 20,
        dividerThickness: 1,
        //showCheckboxColumn: true,
        showBottomBorder: true,
        sortColumnIndex: 0,
        sortAscending: false,
        columns: [
          DataColumn(
            label: Text("prenom"),
            numeric: true,
            // onSort: (_index, ascend) {
            //   setState(() {
            //     ascend = !ascend;
            //   });
            //   trie(_index, ascend);
            //}
          ),
          DataColumn(
            label: Text("nom"),
            numeric: false,
          ),
          // DataColumn(label: Text("Adresse"), numeric: false),
          DataColumn(label: Text("telephone"), numeric: false),
          DataColumn(label: Text("heure"))
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text(patient.prenom)),
            DataCell(Text(patient.nom)),
            DataCell(Text(patient.telephone)),
            DataCell(Text(patient.heure)),
          ])
        ],
      )));
    });
  }
}
