import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutDepense.dart';

class Liste extends StatefulWidget {
  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  final listeDepense = [
    {
      'description': 'Achat de materiel',
      'cout': '123456 ',
      'date': "2021-03-02 ",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depense'),
        // actions: [Text("SELECTIONNER")],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Mes Depenses",
              style: TextStyle(fontSize: 28, letterSpacing: 1.1),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "recherche....",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.request_quote_outlined),
                        radius: 15,
                      ),
                      title: Text("Details"),
                      // listeDepense.map((e) => Text(e['description']),).toList(),

                      // Text('Details'),

                      children: [
                        // Text(
                        //   'Depense',
                        //   style: TextStyle(
                        //       fontSize: 18, fontWeight: FontWeight.bold),
                        // ),
                        // Text('Achat de materiel'),
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
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_sharp),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutDepense()));
          }),
    );
  }
}
