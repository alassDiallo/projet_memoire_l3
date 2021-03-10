import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutDepense.dart';

class Rapport_Depense extends StatefulWidget {
  @override
  _Rapport_DepenseState createState() => _Rapport_DepenseState();
}

class _Rapport_DepenseState extends State<Rapport_Depense> {
  final listeDepense = [
    {
      'description': 'Achat de materiel',
      'cout': '123456 ',
      'date': "2021-03-02 ",
    },
    {
      'description': 'Achat de materiel',
      'cout': '123456 ',
      'date': "2021-03-02 ",
    },
    {
      'description': 'Achat de materiel',
      'cout': '123456 ',
      'date': "2021-03-02 ",
    },
    {
      'description': 'Achat de materiel',
      'cout': '123456 ',
      'date': "2021-03-02 ",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
                title: Text("Historique  dépenses"),
                // Rapport_DepenseDepense.map((e) => Text(e['description']),).toList(),

                // Text('Details'),

                children: [
                  Text(
                    'Dépense',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      DataTable(
                        // dividerThickness: true,
                        //showBottomBorder: true,
                        columns: [
                          DataColumn(
                            label: Text("Description"),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text("Cout"),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text("date"),
                            numeric: false,
                          ),
                        ],
                        rows: listeDepense
                            .map(
                              (depense) => DataRow(cells: [
                                DataCell(
                                  Text(depense['description']),
                                  onTap: () {
                                    // write your code..
                                  },
                                ),
                                DataCell(
                                  Text(depense['cout']),
                                  onTap: () {
                                    // write your code..
                                  },
                                ),
                                DataCell(
                                  Text(depense['date']),
                                  onTap: () {
                                    // write your code..
                                  },
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 15,
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
