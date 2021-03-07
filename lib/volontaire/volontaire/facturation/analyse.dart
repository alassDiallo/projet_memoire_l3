import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutAnalyse.dart';

class Analyse extends StatefulWidget {
  Analyse({Key key}) : super(key: key);

  @override
  _AnalyseState createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  final listeAnalyse = [
    {
      'description': 'Radiographie pulmonaire',
      'cout': '123456 ',
    },
    {
      'description': 'Analyse sanguine',
      'cout': '12000 ',
    },
    {
      'description': 'Scanner',
      'cout': '50000 ',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.blue,
                margin: EdgeInsets.all(10),
                child: DataTable(
                  // dividerThickness: true,
                  showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: Text("Description"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Cout"),
                      numeric: true,
                    ),
                  ],
                  rows: listeAnalyse
                      .map(
                        (analyse) => DataRow(cells: [
                          DataCell(
                            Text(analyse['description']),
                            onTap: () {
                              // write your code..
                            },
                          ),
                          DataCell(
                            Text(analyse['cout']),
                            onTap: () {
                              // write your code..
                            },
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Card(
                shadowColor: Colors.blue,
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      labelText: 'Total à payer',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      )),
                ),
              ),
              RaisedButton(
                child: Text('Valider'),
                onPressed: () {},
                color: Colors.greenAccent,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_sharp),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutAnalyse()));
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }
}
