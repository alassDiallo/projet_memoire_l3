import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
//import 'package:data_tables/data_tables.dart';
import 'package:gestion_materiel_cmu/medecin/listepatient.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'dart:async';
import 'dart:convert' as convert;

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
        p.add(element);
      });
    } else {
      p.remove(element);
    }
  }

  void supprimer() async {
    setState(() {
      if (p.isNotEmpty) {
        List<Patient> tmp = [];
        tmp.addAll(p);
        for (Patient pt in tmp) {
          p.remove(pt);
          p.remove(pt);
        }
      }
    });
  }

  @override
  void initState() {
    ascend = false;
    listeP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de mes patients du jour"),
      ),
      body: Column(
        children: [
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
                    onSort: (_index, ascend) {
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
                DataColumn(label: Text("heure"))
              ],
              rows: p.map((element) {
                return DataRow(
                    selected: p.contains(element),
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
          Row(
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
                      Text("Selectionner ${p.length}"),
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
                    onPressed: p.isEmpty ? null : supprimer),
              )
            ],
          )
        ],
      ),
    );
  }
}
