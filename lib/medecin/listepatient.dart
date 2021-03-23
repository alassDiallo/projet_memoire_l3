import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class ListeP extends StatefulWidget {
  @override
  _ListePState createState() => _ListePState();
}

class _ListePState extends State<ListeP> {
  List<Patient> p = [];

  bool ascend;
  int _index = 0;
  List<Patient> patients = [];
  Future<void> _liste() async {
    String url = "auth/patient";
    print(url);
    var response = await Connexion().recuperation(url);

    if (response.statusCode == 200) {
      var donnee = convert.jsonDecode(response.body);
      print(donnee);
      for (var p in donnee) {
        Patient patient = Patient(
            adresse: p["adresse"],
            telephone: p["telephone"],
            nom: p["nom"],
            prenom: p["prenom"]);

        setState(() {
          patients.add(patient);
        });
      }
    }
  }

  void trie(int index, bool ascend) {
    if (index == 0) {
      if (ascend) {
        patients.sort((a, b) => a.prenom.compareTo(b.prenom));
      } else {
        patients.sort((a, b) => b.prenom.compareTo(a.prenom));
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
          patients.remove(pt);
          p.remove(pt);
        }
      }
    });
  }

  @override
  void initState() {
    ascend = false;
    _liste();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Center(
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
                rows: patients.map((element) {
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
                        DataCell(Text("11H")),
                      ]);
                }).toList(),
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
      ),
    );
  }
}
