import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutOrdonnance.dart';

class Ordonnance extends StatefulWidget {
  Ordonnance({Key key}) : super(key: key);

  @override
  _OrdonnanceState createState() => _OrdonnanceState();
}

class _OrdonnanceState extends State<Ordonnance> {
  final listeOrdonnance = [
    {
      'medicament': 'Doliprane',
      'cout': '2000 ',
    },
    {
      'medicament': 'Vitamine C',
      'cout': '1234 ',
    },
    {
      'medicament': 'Fervex',
      'cout': '5000 ',
    },
    {
      'medicament': 'Xanax',
      'cout': '5300 ',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  appBar: AppBar(
      // title: Text('Ordonnance'),
      // centerTitle: true,
      // ),
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
                      label: Text("Médicament"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Cout"),
                      numeric: true,
                    ),
                  ],
                  rows: listeOrdonnance
                      .map(
                        (Ordonnance) => DataRow(
                            //selected: ,
                            cells: [
                              DataCell(
                                Text(Ordonnance['medicament']),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text(Ordonnance['cout']),
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
                        borderRadius: BorderRadius.circular(15.0),
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
                MaterialPageRoute(builder: (context) => AjoutOrdonnance()));
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }
}
