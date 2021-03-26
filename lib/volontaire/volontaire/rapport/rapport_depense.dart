import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/DepenseList.dart';
import 'package:gestion_materiel_cmu/models/depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutDepense.dart';

class Rapport_Depense extends StatefulWidget {
  @override
  _Rapport_DepenseState createState() => _Rapport_DepenseState();
}

class _Rapport_DepenseState extends State<Rapport_Depense> {
  List<Depense> listeDepense = [];
  List<Depense> listeDep = [];

  Depenselist dep = Depenselist();

  @override
  void initState() {
    super.initState();
    listeDepense = dep.depenses;
  }

  void selctionner(bool b, Depense element) async {
    if (b) {
      setState(() {
        b = true;
        listeDep.add(element);
      });
    } else {
      listeDep.remove(element);
    }
  }

  void supprimer() async {
    setState(() {
      if (listeDep.isNotEmpty) {
        List<Depense> tmp = [];
        tmp.addAll(listeDep);
        for (Depense dep in tmp) {
          listeDepense.remove(dep);
          listeDep.remove(dep);
        }
      }
    });
  }

  // final listeDepense = Depenselist().depenses;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dépense'),
        centerTitle: true,
        // actions: [Text("SELECTIONNER")],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AjoutDepense(),
            SizedBox(
              height: 20,
            ),
            Container(
              // child: ListView.builder(
              //     itemCount: 4,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         // padding: EdgeInsets.all(),
              margin: EdgeInsets.all(15),
              child: ExpansionTile(
                leading: CircleAvatar(
                  child: Icon(Icons.list),
                  radius: 40,
                ),
                title: Text(
                  "Historique ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Rapport_DepenseDepense.map((e) => Text(e['description']),).toList(),

                // Text('Details'),

                children: [
                  // Text(
                  //   'Dépense',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  Column(
                    children: [
                      DataTable(
                        // dividerThickness: true,
                        //showBottomBorder: true,
                        columns: [
                          DataColumn(
                            label: Text("Description"),
                          ),
                          DataColumn(
                            label: Text("Cout"),
                          ),
                          // DataColumn(
                          //   label: Text("date"),
                          //   numeric: false,
                          // ),
                        ],
                        rows: listeDepense
                            .map(
                              (Depense depense) => DataRow(
                                  selected: listeDep.contains(depense),
                                  onSelectChanged: (b) {
                                    selctionner(b, depense);
                                  },
                                  cells: [
                                    DataCell(
                                      Text(depense.description),
                                    ),
                                    DataCell(
                                      Text(depense.cout.toString()),
                                    ),
                                  ]),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              label: listeDep.length == 0
                                  ? Text(
                                      "0 Selectionné(es)",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Text("${listeDep.length} Selectionné(es)"),
                            ),
                          ),
                          SizedBox(width: 5),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: OutlinedButton.icon(
                                onPressed: listeDep.isEmpty ? null : supprimer,
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                                label: Text("Supprimer"),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
