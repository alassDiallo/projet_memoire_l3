import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
//import 'package:data_tables/data_tables.dart';
import 'package:gestion_materiel_cmu/medecin/listepatient.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class ListePatient extends StatefulWidget {
  @override
  _ListePatientState createState() => _ListePatientState();
}

class _ListePatientState extends State<ListePatient> {
  bool ascend;
  int _index = 0;
  List<Patient> p = [];
  List<Patient> l = [];
  Future<void> listeP() async {
    var url = "auth/listePatient";
    print(url);
    var donnees = await Connexion().recuperation(url);
    if (donnees.statusCode == 200) {
      var patient = convert.jsonDecode(donnees.body);
      print(patient);
      for (var pt in patient) {
        setState(() {
          p.add(Patient(
              idPatient: pt['idPatient'],
              nom: pt['nom'],
              prenom: pt['prenom'],
              telephone: pt['telephone'],
              date: pt['date'],
              heure: pt['heure'],
              adresse: pt['adresse']));
        });
      }
      print(p[0].prenom);
      // setState(() {
      //   l = p
      //       .where((element) =>
      //           DateTime.parse(element.date).isAfter(DateTime.now()))
      //       .toList();
      // });
      // print(l.toList());
    }
  }

  @override
  void initState() {
    ascend = false;
    listeP();
    super.initState();
  }

  void trie(int index, bool ascend) {
    if (index == 0) {
      if (ascend) {
        p.sort((a, b) => a.prenom.compareTo(b.prenom));
      } else {
        p.sort((a, b) => b.prenom.compareTo(a.prenom));
      }
    }
  }

  void selctionner(bool b, Patient element) async {
    if (b) {
      setState(() {
        b = true;
        l.add(element);
      });
    } else {
      p.remove(element);
    }
  }

  void supprimer() async {
    setState(() {
      if (l.isNotEmpty) {
        List<Patient> tmp = [];
        tmp.addAll(l);
        for (Patient pt in tmp) {
          p.remove(pt);
          p.remove(pt);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat df = DateFormat("dd/MM/yyyy");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Liste de mes patients du jour"),
      ),
      body: Column(
        children: [
          Card(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              color: Colors.pink,
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(df.format(DateTime.now()).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Divider(
                      indent: 80,
                      endIndent: 80,
                      thickness: 5,
                      color: Colors.white,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      radius: 30,
                      child: Container(child: Text(p.length.toString())),
                    ),
                  ],
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            child: DataTable(
              headingTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              columnSpacing: 20,
              dividerThickness: 1,
              //showCheckboxColumn: true,
              showBottomBorder: true,
              sortColumnIndex: _index,
              sortAscending: ascend,
              columns: [
                DataColumn(
                    label: Text("prenom"),
                    numeric: true,
                    onSort: (_index, sort) {
                      setState(() {
                        ascend = !ascend;
                      });
                      trie(_index, ascend);
                    }),
                DataColumn(
                  label: Text("nom"),
                  numeric: false,
                ),
                // DataColumn(label: Text("Adresse"), numeric: false),
                DataColumn(label: Text("telephone"), numeric: false),
                DataColumn(label: Text("heure"), numeric: false)
              ],
              rows: p.map((element) {
                return DataRow(
                    selected: l.contains(element),
                    onSelectChanged: (b) {
                      selctionner(b, element);
                    },
                    cells: [
                      DataCell(Text(element.prenom)),
                      DataCell(Text(element.nom)),
                      // DataCell(Text(element.adresse)),
                      DataCell(Text(element.telephone)),
                      DataCell(Text(element.heure)),
                    ]);
              }).toList(),
            ),
            decoration: BoxDecoration(
                //color: Colors.pink.withOpacity(0.5),
                /*image: DecorationImage(
                    image: AssetImage(
                      "images/vol.png",
                    ),*/
                //fit: BoxFit.cover)
                ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: OutlineButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        Text("Selectionner ${l.length}"),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 20),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: OutlineButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          Text("Supprimer"),
                        ],
                      ),
                      onPressed: l.isEmpty ? null : supprimer),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
